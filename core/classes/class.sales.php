<?php
class Sales extends Connection
{
    private $table = 'tbl_sales';
    public $pk = 'sales_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_sales_details';
    public $pk2 = 'sales_detail_id';
    public $fk_det = 'product_id';

    public function add()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'customer_id'   => $this->inputs['customer_id'],
            'remarks'       => $this->inputs['remarks'],
            'sales_date'    => $this->inputs['sales_date'],
            'user_id' => isset($this->inputs['encoded_by']) ? $this->inputs['encoded_by'] :  $_SESSION['user_id']
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function edit()
    {
        $form = array(
            'sales_invoice' => $this->inputs['sales_invoice'],
            'customer_id'   => $this->inputs['customer_id'],
            'remarks'       => $this->inputs['remarks'],
            'sales_date'    => $this->inputs['sales_date'],
            'user_id' => isset($this->inputs['encoded_by']) ? $this->inputs['encoded_by'] :  $_SESSION['user_id']
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $Customers = new Customers;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['customer_name'] = $row['customer_id'] > 0 ? $Customers->name($row['customer_id']) : 'walk-in';
            $row['customer'] = $row['customer_id'] > 0 ? $Customers->name($row['customer_id']) : 'walk-in';$row['total'] = number_format($this->total($row['sales_id']), 2);

            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $Customers = new Customers;
        $row['customer_name'] = $Customers->name($row['customer_id']);
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function generate()
    {
        return 'SLS-' . date('YmdHis');
    }

    public function finish()
    {
        $result = $this->select($this->table, "MAX(`q_num`)", "");
        $q_num = $result->fetch_array();
        $primary_id = $this->inputs['id'];
        $form = array(
            'status' => 'F',
            'q_num' => $q_num[0]+1
        );
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = $this->inputs[$this->fk_det];
        $Products = new Products;
        $product_price = $Products->productPrice($fk_det);

        $form = array(
            $this->pk               => $this->inputs[$this->pk],
            $this->fk_det           => $fk_det,
            //'product_category_id'   => $this->inputs['product_category_id'],
            'qty'                   => $this->inputs['qty'],
            'price'                 => $product_price,
            'cost'                  => 0 // change this value
        );

        return $this->insertIfNotExist($this->table_detail, $form, "$this->pk = '$primary_id' AND $this->fk_det = '$fk_det'");
    }

    public function show_detail()
    {
        $Products = new Products;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $count = 1;
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['product'] = $Products->name($row['product_id']);
            $row['amount'] = number_format($row['qty'] * $row['price'], 2);
            $row['pos_qty'] = number_format($row['qty']);
            $row['pos_price'] = "@" . $row['price'];
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function edit_detail()
    {

        $sales_detail_id = $this->inputs['sales_detail_id'];
        $form = array(
            'qty'      => $this->inputs['quantity'],
        );
        return $this->update($this->table_detail, $form, " $this->pk2 = '$sales_detail_id'");
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function total($primary_id)
    {
        $result = $this->select($this->table_detail, 'sum(qty*price)', "$this->pk = '$primary_id'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function cancel_sales()
    {
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number = '$reference_number'";
        $primary_id = $this->getID($param);
        $form = array(
            'status' => 'C'
        );

        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function save_sales()
    {
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number = '$reference_number'";
        $primary_id = $this->getID($param);
        $form = array(
            'status' => 'P'
        );

        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    private function delete_sales_details()
    {
        $query = "CREATE TRIGGER `delete_sales_details` AFTER DELETE ON `tbl_sales` FOR EACH ROW DELETE FROM tbl_sales_details WHERE sales_id = OLD.sales_id";
    }

    public function cancel_sales_trigger()
    {
        $query = "DELIMITER $$
        CREATE TRIGGER `finish_sales` AFTER UPDATE ON `tbl_sales` FOR EACH ROW 
        BEGIN
            UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS';
            DELETE from tbl_product_transactions WHERE header_id=NEW.sales_id and module='SLS' and status='C';
        END$$
        
        DELIMITER ;";
    }

    private function finish_transaction()
    {
        $query = "CREATE TRIGGER `finish_transaction` AFTER UPDATE ON `tbl_sales` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS'";
    }

    private function add_transaction_in()
    {
        $query = "CREATE TRIGGER `add_transaction_in` AFTER INSERT ON `tbl_sales_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity,NEW.cost,NEW.price,NEW.sales_id,NEW.sales_detail_id,'SLS','OUT')";
    }

    public function getID($param)
    {
        $fetch = $this->select($this->table, $this->pk, $param);
        $row = $fetch->fetch_array();
        return $row[0];
    }

    public function getSalesHeader()
    {
        $Customers = new Customers;
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "sales_id='$id'");
        $row = $result->fetch_assoc();
        $row['customer_name'] = $row['customer_id'] > 0 ? $Customers->name($row['customer_id']) : 'walk-in';
        $row['sales_date_mod'] = date("F j, Y", strtotime($row['sales_date']));
        $rows[] = $row;
        return $rows;
    }
    public function getSalesDetails()
    {
        $id = $_POST['id'];
        $Products = new Products;
        $rows = array();
        $result = $this->select($this->table_detail, "*", "sales_id='$id'");
        while ($row = $result->fetch_assoc()) {
            $row['product_name'] = $Products->name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function addSalesPOS()
    {

        if ($this->inputs['product_id'] == "" || $this->inputs['product_id'] <= 0) {
            $Products = new Products;
            $this->inputs['product_id'] = $Products->productID($this->inputs['product_barcode']);
        }

        if ($this->inputs['product_id'] > 0) {

            // check inventory here ...
            
            $reference_number = $this->inputs['reference_number'];
            $param = "reference_number = '$reference_number'";
            $this->inputs['sales_date'] = $this->getCurrentDate();
            $sales_id = $this->add();

            if ($sales_id == -2) {
                $sales_id = $this->getID($param);
            }

            $this->inputs[$this->pk] = $sales_id;

            //$res = $this->add_detail();
            $primary_id = $sales_id;
            $fk_det     = $this->inputs[$this->fk_det];

            $Products = new Products;
            $product_price = $Products->productPrice($fk_det);

            $form = array(
                $this->pk       => $this->inputs[$this->pk],
                $this->fk_det   => $fk_det,
                'qty'           => $this->inputs['quantity'],
                'price'         => $product_price,
                'cost'          => 0
            );

            //return $this->insert($this->table_detail, $form);
            $res = $this->insertIfNotExist($this->table_detail, $form, "sales_id='$primary_id' AND product_id='$fk_det'", 'Y');
            if ($res == -2) {
                $qty = $this->inputs['quantity'];
                $this->inputs['param'] = "sales_id='$primary_id' AND product_id='$fk_det' ";
                $detail_row = $this->show_detail();

                if (sizeof($detail_row) > 0) {
                    $this->inputs['quantity'] = $detail_row[0]['qty'] + $qty;
                    $this->inputs['sales_detail_id'] = $detail_row[0]['sales_detail_id'];
                    $this->edit_detail();
                }
            }

            return 1;
        } else {
            return "Cannot find item. Please try again.";
        }
    }

    public function getDetailsPOS()
    {
        //$row = $this->show();
        //$sales_id = $row[0]['sales_id'];
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number = '$reference_number'";
        $sales_id = $this->getID($param);
        $this->inputs['param'] = "sales_id = '$sales_id'";
        return $this->show_detail();
    }

    public function sales_summary()
    {
        $user_id = $this->inputs['user_id'];
        $rows = array();
        $Products = new Products();
        $result = $this->select($this->table, $this->pk, "user_id='$user_id' AND sales_summary_id=0 AND status='F' ORDER BY date_added ASC ");
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_array()) {
                $rows[] = $row[0];
            }

            if (sizeof($rows) > 0) {
                $count = 0;
                $fetch = $this->select($this->table_detail, "*", "sales_id IN(" . implode(',', $rows) . ") ");
                while ($sales_row = $fetch->fetch_assoc()) {
                    $sales_row['product'] = $Products->name($sales_row['product_id']);
                    $amount = ($sales_row['qty'] * $sales_row['price']) ;
                    $sales_row['amount'] = number_format($amount, 2);
                    $sales_row['pos_qty'] = number_format($sales_row['qty']);
                    $sales_row['pos_price'] = "@" . $sales_row['price'];
                    $sales_row['count'] = $count++;
                    $sales_rows[] = $sales_row;
                }
                return $sales_rows;
            }
        } else {
            return [];
        }
    }

    public function update_review_sales_summary()
    {
        $encoded_by = $this->inputs['encoded_by'];
        $form = array(
            'sales_summary_id' => $this->inputs['sales_summary_id']
        );
        return $this->update($this->table, $form, "sales_summary_id=0 AND user_id='$encoded_by' ");
    }

    public function finishSalesPOS()
    {
        $reference_number = $this->inputs['reference_number'];

        $param = "reference_number='$reference_number'";
        $primary_id = $this->getID($param);
        $result = $this->select($this->table, "MAX(`q_num`)", "");
        $q_num = $result->fetch_array();

        $form = array(
            'status' => 'F',
            'user_id' => $this->inputs['encoded_by'],
            'q_num' => $q_num[0]+1
        );
        $res = $this->update($this->table, $form, "$this->pk = '$primary_id'");

        if ($res == 1) {
            return $primary_id;
        } else {
            return -1;
        }
    }

    public function cancel_sales_pos()
    {
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number = '$reference_number'";
        $primary_id = $this->getID($param);
        $form = array(
            'status' => 'C'
        );

        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function remove_detail_pos()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }
}
