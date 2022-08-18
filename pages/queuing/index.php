<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Queuing</h3>
                <p class="text-subtitle text-muted">Manage queuing here (for staff only)</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./homepage">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Queuing</li>
                    </ol>
                </nav>
            </div>
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
                                <div id="canvas_prepaing" class="card-body row" style="padding-top: 15px;">
                                    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card-header" style="background: #4caf50;">
                                    <h4 class="card-title">Please Collect</h4>
                                </div>
                                <div id="canvas_serving" class="card-body row" style="padding-top: 15px">
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        getPending();
        getPreparing();
        getServing();
    });

    function updateStatus(status,id){

        swal({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-info",
            confirmButtonText: "Yes, continue!",
            cancelButtonText: "No, cancel!",
            closeOnConfirm: false,
            closeOnCancel: false
          },
          function(isConfirm) {
            if (isConfirm) {

                $.ajax({
                    type: 'POST',
                    url: "controllers/sql.php?c=" + route_settings.class_name + "&q=updateStatus",
                    data: {
                        status: status,
                        id:id
                    },
                    success: function(data) {
                        location.reload();
                    }
                }); 
                
            } else {
              swal("Cancelled", "Entries are safe :)", "error");
            }
        });
    }
    
    function getPreparing() {

        $.ajax({
            type: 'POST',
            url:  "controllers/sql.php?c=" + route_settings.class_name + "&q=getPreparing",
            data: {
                
            },
            success: function(data) {
                console.log(data);
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                while (i < arr_count) {
                    console.log(json.data[i]);
                    $("#canvas_prepaing").append('<div class="col-md-6">' +
                        '<h3><div class="btn-group mb-3" role="group" aria-label="Basic example">'+'<i class="bi-check-square-fill" onclick=updateStatus("S",'+json.data[i].sales_id+') style="font-size: 20px;color: #3f51b5;"></i>&nbsp;' + json.data[i].q_num + '</div></h3>' +
                        '</div>');
                    i++;
                }

            }
        });
    }

    function getServing() {

        $.ajax({
            type: 'POST',
            url:  "controllers/sql.php?c=" + route_settings.class_name + "&q=getServing",
            data: {
                
            },
            success: function(data) {
                console.log(data);
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                while (i < arr_count) {
                    console.log(json.data[i]);
                    $("#canvas_serving").append('<div class="col-md-6">' +
                        '<h3><div class="btn-group mb-3" role="group" aria-label="Basic example">'+'<i class="bi-check-square-fill" onclick=updateStatus("F",'+json.data[i].sales_id+') style="font-size: 20px;color: #3f51b5;"></i><i onclick=updateStatus("",'+json.data[i].sales_id+') class="bi-x-square-fill" style="font-size: 20px;color: #f44336;"></i>&nbsp;' + json.data[i].q_num + '</div></h3>' +
                        '</div>');
                    i++;
                }

            }
        });
    }   

    function getPending() {

        $.ajax({
            type: 'POST',
            url:  "controllers/sql.php?c=" + route_settings.class_name + "&q=getPending",
            data: {
                
            },
            success: function(data) {
                console.log(data);
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                while (i < arr_count) {
                    console.log(json.data[i]);
                    $("#tbl_pending").append('<tr>' +
                        '<td>' + json.data[i].q_num + '</td>' +
                        '</tr>');
                    i++;
                }

                if(i <= 0){
                     $("#tbl_pending").html('<tr>' +
                        '<td> No data available</td>' +
                        '</tr>');
                    }

            }
        });
    }
</script>