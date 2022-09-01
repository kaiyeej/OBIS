<html lang="en"><head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="refresh" content="20">
  <title>BeanBrewing Cafė</title>

  <!-- <link rel="stylesheet" href="../assets/css/pages/form-element-select.css"> -->
  <link rel="stylesheet" href="../assets/css/main/app.css">
  <link rel="stylesheet" href="../assets/css/main/app-dark.css">
  <link rel="shortcut icon" href="../assets/images/logo/logo_beanbrew2.png" type="image/x-icon">
  <link rel="shortcut icon" href="../assets/images/logo/logo_beanbrew2.png" type="image/png">
  <link rel="stylesheet" href="../assets/css/shared/iconly.css">
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <link rel="stylesheet" href="../assets/css/pages/fontawesome.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

  <style>
    body.theme-dark .form-check-input:checked {
      background-color: #ad6a1c !important;
      border-color: #ad6a1c !important;
    }

    body.theme-dark .btn-primary {
      background-color: #ad6a1c !important;
      border-color: #ad6a1c !important;
    }

    .btn-primary {
      background-color: #ad6a1c !important;
      border-color: #ad6a1c !important;
    }

    .btn-check:focus+.btn-primary,
    .btn-primary:focus,
    .btn-primary:hover {
      background-color: #efa753 !important;
      ;
      border-color: #efa753 !important;
      ;
    }

    .btn-primary:focus {
      box-shadow: 0 0 0 0.25rem rgb(255 197 130) !important;
    }

    body.theme-dark .dropdown-menu {
      background-color: #161b22 !important;
    }

    /* .dropdown-menu {
      background-color: #bdbdbd !important;

    } */

    .form-check-input:focus {
      border-color: #efa753;

    }

    .page-item.active .page-link {
      background-color: #ad6a1c !important;
      border-color: #ad6a1c !important;
    }

    body.theme-dark ol,
    body.theme-dark ul {
      padding-left: 0rem !important;
    }

    body.theme-dark .select2-container--default .select2-search--dropdown .select2-search__field {
      border: 1px solid #35354f !important;
    }

    body.theme-dark .select2-container--default .select2-selection--single {
      background-color: #1b1b29 !important;
      border: 1px solid #35354f !important;

    }

    body.theme-dark .select2-dropdown {
      background-color: #40404d !important;
    }

    body.theme-dark .select2-container--default .select2-results__option[aria-selected=true] {
      background-color: #939393 !important;
      color: #fff !important;
    }
  </style>
</head>

<body class="theme-dark" data-new-gr-c-s-check-loaded="14.1073.0" data-gr-ext-installed="" data-gr-ext-disabled="forever">

  <div id="app">
    <div id="main" style="margin-left:0px;">
      <header class="mb-3">
        <a href="#" class="burger-btn d-block d-xl-none">
          <i class="bi bi-justify fs-3"></i>
        </a>
      </header>

      <!-- PAGE START -->
      <div class="page-heading">
        <div class="page-title">
          <div class="row">
            
          </div>
        </div>
        <section class="section">
          <div class="row" id="basic-table">
            <div class="col-12 col-md-3">
              <div class="card">
                <div class="card-content">
                  <div class="card-body">
                    <!-- Table with outer spacing -->
                    <div class="table-responsive">
                      <table class="table table-lg">
                        <thead style="font-weight: 800;color: #f44336;">
                          <tr>
                            <th>Pending Orders</th>
                          </tr>
                        </thead>
                        <tbody style="text-align: center;" id="tbl_pending">
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-md-9">
              <div class="card">
                <div class="card-content">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="card-header" style="background: #9e9e9e;">
                        <h4 class="card-title">Now Preparing</h4>
                      </div>
                      <div id="canvas_prepaing" class="card-body row" style="padding-top: 15px;text-align:center;"></div>
                    </div>
                    <div class="col-md-6">
                      <div class="card-header" style="background: #4caf50;">
                        <h4 class="card-title">Please Collect</h4>
                      </div>
                      <div id="canvas_serving" class="card-body row" style="padding-top: 15px;text-align:center;"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>

      <!-- PAGE END -->

    </div>
  </div>
  <!-- <script src="../assets/js/extensions/form-element-select.js"></script> -->

  <script type="text/javascript">
    $(document).ready(function() {
        getPending();
        getPreparing();
        getServing();
        window.onload = maxWindow;
    });
    

function maxWindow() {
    window.moveTo(0, 0);

    if (document.all) {
        top.window.resizeTo(screen.availWidth, screen.availHeight);
    }

    else if (document.layers || document.getElementById) {
        if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
            top.window.outerHeight = screen.availHeight;
            top.window.outerWidth = screen.availWidth;
        }
    }
}
    function getPreparing() {

        $.ajax({
            type: 'POST',
            url:  "../controllers/sql.php?c=Queuing&q=getPreparing",
            data: {
                
            },
            success: function(data) {
                console.log(data);
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                if(arr_count <= 0){
                    $("#canvas_prepaing").html('<tr>' +'<td> No data available</td>' +'</tr>');
                }else{
                  while (i < arr_count) {
                      console.log(json.data[i]);
                      $("#canvas_prepaing").append('<div class="col-md-12">' +
                          '<h3><div class="btn-group mb-3" role="group" aria-label="Basic example">' + json.data[i].q_num + '</div></h3>' +
                          '</div>');
                      i++;
                  }
                }

            }
        });
    }

    function getServing() {

        $.ajax({
            type: 'POST',
            url:  "../controllers/sql.php?c=Queuing&q=getServing",
            data: {
                
            },
            success: function(data) {
                console.log(data);
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                if(arr_count <= 0){
                    $("#canvas_serving").html('<tr>' +'<td> No data available</td>' +'</tr>');
                }else{
                  while (i < arr_count) {
                      $("#canvas_serving").append('<div class="col-md-6">' +
                          '<h3><div class="btn-group mb-3" role="group" aria-label="Basic example">' + json.data[i].q_num + '</div></h3>' +
                          '</div>');
                      i++;
                  }
                }

            }
        });
    }   

    function getPending() {

        $.ajax({
            type: 'POST',
            url:  "../controllers/sql.php?c=Queuing&q=getPending",
            data: {
                
            },
            success: function(data) {
                console.log(data);
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                if(arr_count <= 0){
                    $("#tbl_pending").html('<tr>' +'<td> No data available</td>' +'</tr>');
                }else{
                  while (i < arr_count) {
                      console.log(json.data[i]);
                      $("#tbl_pending").append('<tr>' +
                          '<td>' + json.data[i].q_num + '</td>' +
                          '</tr>');
                      i++;
                  }
                }

            }
        });
    }
</script>


<svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;"><defs id="SvgjsDefs1002"></defs><polyline id="SvgjsPolyline1003" points="0,0"></polyline><path id="SvgjsPath1004" d="M0 0 "></path></svg></body></html>