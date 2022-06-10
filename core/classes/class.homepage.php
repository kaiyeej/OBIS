<?php

class Homepage extends Connection
{
    public function expenses_graph()
    {
        $list = array();
        $result = $this->select('tbl_expense_category');
        while($row = $result->fetch_assoc()){
            $list[] = 1;
        }

        return json_encode($list);
    }

}

?>
