<?php
class PurchaseOrder extends Connection{
    private $table = 'tbl_purchase_order';
    public $pk = 'po_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_purchase_order_details';
    public $pk2 = 'po_detail_id';
    public $fk_det = 'product_id';

    public function add()
    {
        $form = array(
            $this->name => $this->clean($this->inputs[$this->name]),
            'supplier_id' => $this->inputs['supplier_id'],
            'po_type' => $this->inputs['po_type'],
            'paid_status' => ($this->inputs['po_type'] == "C" ? 1 : 0),
            'po_date' => $this->inputs['po_date'],
            'po_remarks' => $this->inputs['po_remarks'],
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = $this->inputs[$this->fk_det];

        $form = array(
            $this->pk => $this->inputs[$this->pk],
            $this->fk_det => $fk_det,
            'qty' => $this->inputs['qty'],
            'supplier_price' => $this->inputs['supplier_price'],
        );

        return $this->insert($this->table_detail, $form);
    }

    public function edit()
    {
        $form = array(
            'supplier_id'   => $this->inputs['supplier_id'],
            'po_type' => $this->inputs['po_type'],
            'po_date'    => $this->inputs['po_date'],
            'po_remarks'       => $this->inputs['po_remarks']
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function view()
    {
        $Suppliers = new Suppliers;
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['supplier_name'] = $Suppliers->name($row['supplier_id']);
        return $row;
    }

    public function show_detail()
    {
        $Products = new Products();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['amount'] = $row['supplier_price']*$row['qty'];
            $row['product'] = $Products->name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function show()
    {
        $Suppliers = new Suppliers();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['supplier_id'] = $Suppliers->name($row['supplier_id']);
            $row['total'] = $this->total($row['po_id']);
            $row['po_ref'] = $row['reference_number']." (₱".number_format($this->po_balance($row['po_id']),2).")";
            $rows[] = $row;
        }
        return $rows;
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $form = array(
            'status' => 'F',
        );
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function generate()
    {
        return 'PO-' . date('YmdHis');
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    
    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function po_id($primary_id)
    {
        
        $result = $this->select($this->table, $this->pk, "$this->name = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function get_row($primary_id, $field){
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$field];
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function total($primary_id)
    {
        $result = $this->select($this->table_detail, 'sum(qty*supplier_price)', "$this->pk = '$primary_id'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function po_balance($primary_id)
    {
        $po_total = $this->total($primary_id);

        $fetch_sp = $this->select('tbl_supplier_payment_details as d, tbl_supplier_payment as h', "sum(amount) as total", "d.po_id = $primary_id AND h.sp_id=d.sp_id AND h.status='F'");
        $paid_total = 0;
        while ($row = $fetch_sp->fetch_assoc()) {
            $paid_total += $row['total'];
        }

        return $po_total-$paid_total;
    }

    private function delete_sales_details()
    {
        $query = "CREATE TRIGGER `delete_po_details` AFTER DELETE ON `tbl_purchase_order` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id";
    }

    private function finish_transaction()
    {
        $query = "CREATE TRIGGER `finish_transaction` AFTER UPDATE ON `tbl_sales` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.sales_status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS'";
    }

    private function add_transaction_in()
    {
        $query = "CREATE TRIGGER `add_transaction_in` AFTER INSERT ON `tbl_sales_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity,NEW.cost,NEW.price,NEW.sales_id,NEW.sales_detail_id,'SLS','OUT')";
    }

}

?>