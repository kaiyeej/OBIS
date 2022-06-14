<?php

session_start();
// print_r($_SESSION);
// echo count($_SESSION);
if (count($_SESSION) > 0) {
    header("location:../index.php");
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mazer Admin Dashboard</title>
    <link rel="stylesheet" href="../assets/css/main/app.css">
    <link rel="stylesheet" href="../assets/css/pages/auth.css">
    <link rel="shortcut icon" href="../assets/images/logo/favicon.svg" type="image/x-icon">
    <link rel="shortcut icon" href="../assets/images/logo/favicon.png" type="image/png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo" style="margin-bottom: 2rem;">
                        <a href="index.html"><img src="../assets/images/logo/logo.svg" alt="Logo"></a>
                    </div>
                    <h5 class="auth-title" style="font-size: 25px;">Log in</h5>
                    <p class="auth-subtitle mb-5" style="font-size: 16px; line-height: 1rem;">Log in with your data that you entered during registration.</p>

                    <form method="POST" id="frm_login">
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="input[username]" id="username" placeholder="Username">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" name="input[password]" id="password" placeholder="Password">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <!-- <div class="form-check form-check-lg d-flex align-items-end">
                            <input class="form-check-input me-2" type="checkbox" value="" id="flexCheckDefault">
                            <label class="form-check-label text-gray-600" for="flexCheckDefault">
                                Keep me logged in
                            </label>
                        </div> -->
                        <button button="submit" class="btn btn-primary btn-block btn-lg shadow-lg mt-2" id="btn_submit">Log in</button>
                    </form>
                    <!-- <div class="text-center mt-5 text-lg fs-4">
                        <p class="text-gray-600">Don't have an account? <a href="auth-register.html" class="font-bold">Sign
                                up</a>.</p>
                        <p><a class="font-bold" href="auth-forgot-password.html">Forgot password?</a>.</p>
                    </div> -->
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">

                </div>
            </div>
        </div>

    </div>
</body>

<script>
    $("#frm_login").submit(function(e) {
        e.preventDefault();
        var url = "../controllers/sql.php?c=LoginUser&q=login";
        var data = $("#frm_login").serialize();
        $("#btn_submit").prop('disabled', true);
        $("#btn_submit").html("<span class='fa fa-spinner fa-spin'></span> Verifying ...");
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function(data) {

                // var json = JSON.parse(data);
                console.log(data);

                setTimeout(function() {
                    window.location = "../index.php";
                }, 2000);

            }
        });


    });
</script>

</html>