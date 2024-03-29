<?php
class Expense extends Connection
{
    private $table = 'tbl_expense';
    public $pk = 'expense_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_expense_details';
    public $pk2 = 'expense_detail_id';
    public $fk_det = 'expense_category_id';

    public $module = 'EXP-';
    public function add()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'remarks'       => $this->inputs['remarks'],
            'expense_date'  => $this->inputs['expense_date'],
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function edit()
    {
        $form = array(
            'remarks'       => $this->inputs['remarks'],
            'expense_date'  => $this->inputs['expense_date'],
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function generate()
    {
        return $this->module  . date('YmdHis');
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $form = array(
            'status' => 'F',
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

        $form = array(
            $this->pk       => $this->inputs[$this->pk],
            $this->fk_det   => $fk_det,
            'supplier_id'   => $this->inputs['supplier_id'],
            'remarks'    => $this->inputs['remarks'],
            'amount'        => $this->inputs['amount'],
        );

        return $this->insertIfNotExist($this->table_detail, $form, "$this->pk = '$primary_id' AND $this->fk_det = '$fk_det'");
    }

    public function show_detail()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['expense_category'] = ExpenseCategories::name($row['expense_category_id']);
            $row['supplier'] = Suppliers::name($row['supplier_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function monthly_total($id)
    {
        $date = $this->getCurrentDate();
        $result = $this->select('tbl_expense_details as d, tbl_expense as h', "sum(amount) as total", "h.expense_id=d.expense_id AND h.status='F' AND MONTH(h.expense_date) = MONTH('$date') AND d.expense_category_id='$id'");
        $total = 0;
        while ($row = $result->fetch_assoc()) {
            $total += $row['total'];
        }

        return $total;
    }
    public function getExpenseHeader()
    {
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "$this->pk='$id'");
        $row = $result->fetch_assoc();
        $row['expense_date_mod'] = date("F j, Y", strtotime($row['expense_date']));
        $rows[] = $row;
        return $rows;
    }
    public function getExpenseDetails()
    {
        $id = $_POST['id'];
        $Supplier = new Suppliers;
        $ExpenseCategories = new ExpenseCategories;
        $rows = array();
        $result = $this->select($this->table_detail, "*", "$this->pk='$id'");
        while ($row = $result->fetch_assoc()) {
            $row['supplier_name'] = $Supplier->name($row['supplier_id']);
            $row['expense_category'] = $ExpenseCategories->name($row['expense_category_id']);
            $rows[] = $row;
        }
        return $rows;
    }
}
