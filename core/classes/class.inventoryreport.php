<?php

class InventoryReport extends Connection
{
    private $table = 'tbl_products';
    public $pk = 'product_id';
    public $name = 'product_name';
    public function generate_report()
    {
        $result = $this->select($this->table, "*", "");
        return $result->fetch_assoc();
    }
}
