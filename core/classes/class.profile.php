<?php
class Profile extends Connection
{
    private $table = 'tbl_users';
    public $pk = 'user_id';
    public $name = 'user_fullname';

    public function updateProfile()
    {
        $fullname =  $_POST['fullname'];
        $username = $_POST['username'];
        $user_id = $_POST['user_id'];
        $password = md5($_POST['password']);

        // $result = $this->select($this->table, '*', "user_fullname='$fullname' AND username='$username' AND password='$password'");



        $form = array(
            'user_fullname' => $fullname,
            'username' => $username,
        );
        $update = $this->update($this->table, $form, "$this->pk='$user_id'");
        // return $result->num_rows;

        return $update;
    }

    public function updatePassword()
    {
        $fullname =  $_POST['fullname'];
        $username = $_POST['username'];
        $user_id = $_POST['user_id'];
        $password = md5($_POST['password']);
        $new_password1 = md5($_POST['new_password1']);

        $result = $this->select($this->table, '*', "user_id='$user_id' AND password='$password'");

        if ($result->num_rows > 0) {
            $form = array(
                'user_fullname' => $fullname,
                'username' => $username,
                'password' => $new_password1
            );
            $update = $this->update($this->table, $form, "$this->pk='$user_id'");
            // return $result->num_rows;
        } else {
            $update = 0;
        }



        return $update;
    }
}
