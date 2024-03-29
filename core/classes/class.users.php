<?php

class Users extends Connection
{
    private $table = 'tbl_users';
    private $pk = 'user_id';
    private $name = 'username';

    public function add()
    {
        $username = $this->clean($this->inputs['username']);
        $is_exist = $this->select($this->table, $this->pk, "username = '$username'");
        if ($is_exist->num_rows > 0) {
            return 2;
        } else {
            $pass = $this->inputs['password'];
            $form = array(
                'user_fullname' => $this->inputs['user_fullname'],
                'user_category' => $this->inputs['user_category'],
                'date_added' => $this->getCurrentDate(),
                'username' => $this->inputs['username'],
                'password' => md5($pass)
            );
            return $this->insert($this->table, $form);
        }
    }

    public function edit()
    {
        $primary_id = $this->inputs[$this->pk];
        $user_fullname = $this->clean($this->inputs['user_fullname']);
        $username = $this->clean($this->inputs['username']);
        $is_exist = $this->select($this->table, $this->pk, "username = '$username' AND  $this->pk != '$primary_id'");
        if ($is_exist->num_rows > 0) {
            return 2;
        } else {
            $form = array(
                'user_fullname' => $user_fullname,
                'user_category' => $this->inputs['user_category'],
                'username' => $username
            );
            return $this->update($this->table, $form, "$this->pk = '$primary_id'");
        }
    }


    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function show()
    {
        $rows = array();
        $result = $this->select($this->table);
        while ($row = $result->fetch_assoc()) {
            $row['category'] = ($row['user_category'] == "A" ? "Admin" : "Staff" );
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        return $result->fetch_assoc();
    }

    public static function name($primary_id)
    {
        $self = new self;
        $result = $self->select($self->table, $self->name, "$self->pk  = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$self->name];
    }

    public function loginCashier()
    {
        $response = [];
        $username = $this->clean($this->inputs['username']);
        $password = md5($this->clean($this->inputs['password']));
        $result = $this->select($this->table, '*', "username = '$username' AND password = '$password' AND user_category='C'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $response['login'] = 'Yes';
            $response['user_id'] = $row['user_id'];
            $response['user_fullname'] = $row['user_fullname'];
            //$_SESSION['user']['id'] = $row['user_id'];
        } else {
            $response['login'] = 'No';
            $response['user_id'] = "";
        }
        return $response;
    }
}
