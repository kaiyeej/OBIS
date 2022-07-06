<?php

class InventoryReport extends Connection
{
    private $table = 'tbl_products';
    public $pk = 'product_id';
    public $name = 'product_name';
    public function generate_report()
    {
        $start_date = $_REQUEST['start_date'];
        $end_date = $_REQUEST['end_date'];
        $ProductCategories = new ProductCategories();
        $result = $this->select($this->table, "*", "DATE(date_added) BETWEEN '$start_date' AND '$end_date'");
        $rows = array();

        while ($row = $result->fetch_assoc()) {

            $po = $this->getQuantityByDate($start_date, $end_date, $row['product_id']);
            $row['product_category'] = $ProductCategories->name($row['product_category_id']);
            $row['qty'] = $po['qty'];
            $rows[] = $row;
        }
        return $rows;
    }
    public function getQuantityByDate($start_date, $end_date, $product_id)
    {
        $result = $this->select("tbl_purchase_order as a, tbl_purchase_order_details as b", "b.qty, b.supplier_price", "a.po_date BETWEEN '$start_date' AND '$end_date' AND b.product_id='$product_id' AND a.po_id=b.po_id AND a.status='F'");
        $count = mysqli_num_rows($result);

        if ($count > 0) {
            $row = $result->fetch_assoc();
        } else {
            $row = array(
                "qty" => 0,
                "supplier_price" => 0,
            );
        }


        return $row;
    }
}
