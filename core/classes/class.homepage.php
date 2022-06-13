<?php

class Homepage extends Connection
{
    public function expenses_graph()
    {
        $rows = array();
        $result = $this->select('tbl_expense_category');
        $count = 0;
        while($row = $result->fetch_assoc()){
            $Expense = new Expense();
            $list['label'] = $row['expense_category'];
            $list['total'] =  $Expense->monthly_total($row['expense_category_id']);
            $rows[] = $list;
        }

        return $rows;
    }

    public function monthly_graph()
    {
        $date = $this->getCurrentDate();
        $months = array();
        $m = 1;
        for ($i = 0; $i < 12; $i++) {
           
            $result = $this->select('tbl_sales_details as d, tbl_sales as h', "count(h.sales_id) as count, sum(qty*price) as total", "d.sales_id=h.sales_id AND h.status = 'F' AND MONTH(h.sales_date) = '$m' AND YEAR(h.sales_date) = YEAR('$date')");

            $total_sales = $result->fetch_array();
            
            if($total_sales['count'] == 0){
                $total = 0;
            }else{
                $total = $total_sales['total'];
            }

            $months[] = $total;
            $m++;
        }
        return $months;
    }

    public function total_user(){
        $result = $this->select("tbl_users", "count(user_id)");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function total_sales(){
        $result = $this->select('tbl_sales_details as d, tbl_sales as h', "sum(qty*price)", "d.sales_id=h.sales_id AND h.status = 'F'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function total_customer(){
        $result = $this->select("tbl_customers", "count(customer_id)");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function total_product(){
        $result = $this->select("tbl_products", "count(product_id)");
        $row = $result->fetch_array();
        return $row[0];
    }
}

?>
