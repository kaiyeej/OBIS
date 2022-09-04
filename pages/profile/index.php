<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Profile</h3>
                <p class="text-subtitle text-muted">Manage Profile</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./homepage">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Products</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="row">
                <div class="col-md-3 mt-3" style="margin-left: 10px;">
                    <div class="card">
                        <div class="card-content">
                            <img src="assets/images/samples/motorcycle.jpg" class="card-img-top img-fluid" alt="singleminded" />
                            <div class="card-body">
                                <h5 class="card-title"><?= $_SESSION["user_fullname"] ?></h5>
                                <p class="card-text">
                                    <?= $_SESSION["user_category"] == 'A' ? 'Admin' : 'Staff' ?>
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-8 mt-3" style="margin-left: 10px;">


                    <div class="form-group">
                        <label><strong>Fullname</strong></label>
                        <input type="text" class="form-control" id="fullname" required name="input[fullname]" placeholder="Fullname" value="<?= $_SESSION["user_fullname"] ?>" />

                    </div>
                    <div class="form-group">
                        <label><strong>Username</strong></label>
                        <input type="text" class="form-control" id="username" required name="input[username]" placeholder="Username" value="<?= $_SESSION["username"] ?>" />
                    </div>
                    <div class="form-group">
                        <label><strong>Current Password</strong></label>
                        <input type="password" class="form-control" id="password" name="input[password]" placeholder="Enter current password to change." />

                    </div>
                    <a href="#" class="btn btn-outline-primary" onclick="saveChanges()" style="float: right;">Save Changes</a>

                </div>

            </div>
        </div>
    </section>
</div>
<?php require_once 'modal_password_confirm.php';
?>
<?php require_once 'modal_password_update.php';
?>
<script type="text/javascript">
    function saveChanges() {

        // console.log('test');
        var password = $("#password").val();

        if (password == "") {
            $("#modalProfile").modal('show');
        } else {
            $("#modalPassword").modal('show');
        }


    };

    function updateProfile() {
        var password = $("#confirm_password").val();
        var fullname = $("#fullname").val();
        var username = $("#username").val();
        var user_id = $("#user_id").val();
        var text = "You session will be logout. contiue?";
        if (confirm(text) == true) {
            $.ajax({
                type: 'POST',
                url: "controllers/sql.php?c=" + route_settings.class_name + "&q=updateProfile",
                data: {
                    user_id: user_id,
                    fullname: fullname,
                    username: username,
                    password: password
                },
                success: function(res) {
                    // alert(res);
                    logout();
                }
            });
        } else {
            return false;
        }

    }

    function updatePasswordProfile() {
        var fullname = $("#fullname").val();
        var username = $("#username").val();
        var user_id = $("#user_id").val();
        var password = $('#password').val();
        var new_password1 = $('#new_password1').val();
        var new_password2 = $('#new_password2').val();
        if (new_password1 == new_password2) {
            var text = "You session will be logout. contiue?";
            if (confirm(text) == true) {
                $.ajax({
                    type: 'POST',
                    url: "controllers/sql.php?c=" + route_settings.class_name + "&q=updatePassword",
                    data: {
                        user_id: user_id,
                        fullname: fullname,
                        username: username,
                        password: password,
                        new_password1: new_password1
                    },
                    success: function(data) {
                        // alert(res);
                        var json = JSON.parse(data);
                        // alert(json.data);
                        if (json.data == 1) {
                            logout();
                        } else {
                            alert('Incorrect current password');
                        }

                    }
                });
            } else {
                return false;
            }
        } else {
            alert("New password doesn't much");
        }

    }
    $(document).ready(function() {
        // getEntries();
        // getSelectOption('ProductCategories', 'product_category_id', 'product_category');
    });
</script>