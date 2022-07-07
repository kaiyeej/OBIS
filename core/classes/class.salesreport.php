<?php

class SalesReport extends Connection
{
    private $table = 'tbl_sales';
    public $pk = 'sales_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_sales_details';
    public $pk2 = 'sales_detail_id';
    public $fk_det = 'product_id';
    public function generate_report()
    {
        $start_date = $_REQUEST['start_date'];
        $end_date = $_REQUEST['end_date'];
        $result = $this->select("tbl_sales AS s, tbl_sales_details AS sd", "sd.product_id, s.customer_id, (sd.qty * sd.price) as total, SUM(sd.qty) as qty, SUM(sd.price) as price", "s.sales_id=sd.sales_id AND s.status='F' AND s.sales_date BETWEEN '$start_date' AND '$end_date' GROUP BY sd.product_id");
        $rows = array();

        while ($row = $result->fetch_assoc()) {
            $Customer = new Customers;
            $Product = new Products;
            $row['customer'] = $Customer->name($row['customer_id']);
            $row['product'] = $Product->name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }
}
