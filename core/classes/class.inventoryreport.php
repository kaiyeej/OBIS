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

        $result = $this->select("tbl_products");
        $rows = array();
        while ($row = $result->fetch_assoc()) {
            $row['product_name'] = $row['product_name'];
            $row['cost'] = $row['product_cost'];
            $row['product_category'] = $ProductCategories->name($row['product_category_id']);
            $row['qty'] = $this->invQty($row['product_id'], $start_date, $end_date);
            $rows[] = $row;
        }
        return $rows;

    }

    public function getJoFinished($product_id)
    {
        $result = $this->select("tbl_job_orders", "SUM(no_of_batches) as qty", "product_id='$product_id' AND STATUS='F' GROUP BY product_id");
        $count = mysqli_num_rows($result);

        if ($count > 0) {
            $row = $result->fetch_assoc();
        } else {
            $row = array(
                "qty" => 0
            );
        }
        return $row;
    }
    public function getJoDetails($product_id)
    {
        $result = $this->select("tbl_job_orders jo, tbl_job_order_details AS jod", "SUM(jod.qty) AS qty ", "jo.`status`='F' AND jod.product_id='$product_id'  AND jod.job_order_id=jo.job_order_id  GROUP BY jod.product_id");
        $count = mysqli_num_rows($result);

        if ($count > 0) {
            $row = $result->fetch_assoc();
        } else {
            $row = array(
                "qty" => 0
            );
        }
        return $row;
    }

    public function getSales($product_id)
    {

        $result = $this->select("tbl_sales AS s, tbl_sales_details AS sd", "SUM(sd.qty) AS qty", "sd.product_id='$product_id' AND s.`status`='F' AND sd.sales_id=s.sales_id GROUP BY sd.product_id");
        $count = mysqli_num_rows($result);

        if ($count > 0) {
            $row = $result->fetch_assoc();
        } else {
            $row = array(
                "qty" => 0
            );
        }
        return $row;
    }

    public function currentQty($product_id){
        //in
        $fetch_po = $this->select("tbl_purchase_order po, tbl_purchase_order_details pod", "SUM(pod.qty)", "pod.product_id='$product_id' AND po.`status`='F' AND po.po_id=pod.po_id");
        $po_qty = $fetch_po->fetch_array();

        $fetch_jo_in = $this->select("tbl_job_orders", "SUM(no_of_batches)", "product_id='$product_id' AND `status`='F'");
        $jo_in_qty = $fetch_jo_in->fetch_array();

        $in_qty = $po_qty[0]+$jo_in_qty[0];

        //out
        $fetch_sales = $this->select("tbl_sales sh, tbl_sales_details sd", "SUM(sd.qty)", "sd.product_id='$product_id' AND sh.sales_id=sd.sales_id AND sh.`status`='F'");
        $sales_qty = $fetch_sales->fetch_array();

        $fetch_jo_out = $this->select("tbl_job_orders jo, tbl_job_order_details as jd", "SUM(jd.qty)", "jd.product_id='$product_id' AND jo.status='F' AND jo.job_order_id=jd.job_order_id");
        $jo_out_qty = $fetch_jo_out->fetch_array();
        
        $out_qty = $sales_qty[0]+$jo_out_qty[0];

        return $in_qty-$out_qty;
    }

    public function invQty($product_id, $start_date, $end_date){
        //in
        $fetch_po = $this->select("tbl_purchase_order po, tbl_purchase_order_details pod", "SUM(pod.qty)", "pod.product_id='$product_id' AND po.`status`='F' AND po.po_id=pod.po_id AND po.po_date BETWEEN '$start_date' AND '$end_date'");
        $po_qty = $fetch_po->fetch_array();

        $fetch_jo_in = $this->select("tbl_job_orders", "SUM(no_of_batches)", "product_id='$product_id' AND `status`='F' AND job_order_date BETWEEN '$start_date' AND '$end_date'");
        $jo_in_qty = $fetch_jo_in->fetch_array();

        $in_qty = $po_qty[0]+$jo_in_qty[0];

        //out
        $fetch_sales = $this->select("tbl_sales sh, tbl_sales_details sd", "SUM(sd.qty)", "sd.product_id='$product_id' AND sh.sales_id=sd.sales_id AND sh.`status`='F' AND sh.sales_date BETWEEN '$start_date' AND '$end_date'");
        $sales_qty = $fetch_sales->fetch_array();

        $fetch_jo_out = $this->select("tbl_job_orders jo, tbl_job_order_details as jd", "SUM(jd.qty)", "jd.product_id='$product_id' AND jo.status='F' AND jo.job_order_id=jd.job_order_id AND jo.job_order_date BETWEEN '$start_date' AND '$end_date'");
        $jo_out_qty = $fetch_jo_out->fetch_array();
        
        $out_qty = $sales_qty[0]+$jo_out_qty[0];

        return $in_qty-$out_qty;
    }
    
}
