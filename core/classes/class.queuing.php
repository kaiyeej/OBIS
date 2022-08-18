<?php
class Queuing extends Connection
{
    private $table = 'tbl_sales';
    public $pk = 'sales_id';
    public $name = 'reference_number';

    public function getPending()
    {
        $rows = array();
        $last = $this->lastP();
        $result = $this->select($this->table, "*", "q_status='' AND q_num > '$last' ORDER BY q_num ASC ");
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    }

    public function getPreparing()
    {
        $rows = array();
        $result = $this->select($this->table, "*", "q_status='' AND status='F' ORDER BY q_num ASC LIMIT 5");
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    }
    
    public function getServing()
    {
        $rows = array();
        $result = $this->select($this->table, "*", "q_status='S' AND status='F' ORDER BY q_num ASC");
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    }

    public function lastP()
    {
        
        $result = $this->select($this->table, "*", "q_status='' AND status='F' ORDER BY q_num ASC LIMIT 0,5");
        while ($row = $result->fetch_assoc()) {
            $last = $row['q_num'];
        }
        return $last;
    }

    function updateStatus(){
        $status = $_POST['status'];
        $sales_id = $_POST['id'];
        $form = array(
            'q_status' => $status
        );

        return $this->update($this->table, $form, "$this->pk = '$sales_id'");
    }
}

?>
