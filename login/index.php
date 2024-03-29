<?php

session_start();
// print_r($_SESSION);
if (isset($_SESSION["status"])) {
    header("location:../homepage");
    // echo "set";
}
// if (count($_SESSION) > 0) {
//     header("location:../index.php");
// }

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BeanBrewing Cafė</title>
    <link rel="stylesheet" href="../assets/css/main/app.css">
    <link rel="stylesheet" href="../assets/css/pages/auth.css">
    <link rel="shortcut icon" href="../assets/images/logo/logo_beanbrew2.png" type="image/x-icon">
    <link rel="shortcut icon" href="../assets/images/logo/logo_beanbrew2.png" type="image/png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo" style="margin-bottom: 1rem;">
                        <a href="index.html"><img src="../assets/images/logo/logo_beanbrew1.png" style="height: 70px;" alt="Logo"></a>
                    </div>
                    <h5 class="auth-title" style="font-size: 25px;">Log in</h5>
                    <p class="auth-subtitle mb-5" style="font-size: 16px; line-height: 1rem;">Log in with your data that you entered during registration.</p>
                    <div id="alert_div"></div>
                    <form method="POST" id="frm_login">
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" required name="input[username]" id="username" placeholder="Username">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" required name="input[password]" id="password" placeholder="Password">
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
                        <button button="submit" style="background-color: #ad6a1c; border-color: #ad6a1c;" class="btn btn-primary btn-block btn-lg shadow-lg mt-2" id="btn_submit">Log in</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p><a class="font-bold" href="/obis/queuing-page/index.php">Queuing System</a>.</p>
                    </div>
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
                var json = JSON.parse(data);
                if (json.data == 0) {
                    $("#alert_div").html('<div class="alert alert-light-danger color-danger"><i class="bi bi-exclamation-circle"></i> Credentials not found.</div>');
                    setTimeout(function() {
                        $("#alert_div").html("");
                    }, 1500);
                    $("#btn_submit").prop('disabled', false);
                    $("#btn_submit").html("Log in");
                    $("#username").val("");
                    $("#password").val("");
                } else {
                    $("#alert_div").html('<div class="alert alert-light-success color-success"><i class="bi bi-exclamation-circle"></i> Successfull login! Redirecting..</div>');
                    setTimeout(function() {
                        window.location = "../homepage";
                    }, 2000);
                }

                // var json = JSON.parse(data);
                console.log(json.data);

            }
        });


    });
</script>

</html>