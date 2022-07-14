<style>
    .select2-container--default .select2-selection--single {
        background-color: #fff !important;
        border: 1px solid #dce7f1 !important;
        border-radius: 4px !important;
        height: 39px !important;
    }

    .select2-container--default .select2-selection--single .select2-selection__rendered {
        color: #909ba6 !important;
        line-height: 36px !important;
    }

    .select2-container--default .select2-selection--single .select2-selection__arrow b {
        border-color: #909ba6 transparent transparent transparent !important;
        margin-top: 3px !important;

    }
</style>
<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Job Order</h3>
                <p class="text-subtitle text-muted">Manage job Order here</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./homepage">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Job Order</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-header">
                <div class="btn-group divider divider-right">
                    <div style="float: right">
                        <a href="#" class="btn btn-primary btn-sm btn-icon-split" onclick="addModal()">
                            <span class="icon text-white-50">
                                <i class="fas fa-plus"></i>
                            </span>
                            <span class="text">Add Entry</span>
                        </a>
                        <a href="#" class="btn btn-danger btn-sm btn-icon-split" onclick='deleteEntry()' id='btn_delete'>
                            <span class="icon text-white-50">
                                <i class="fas fa-trash"></i>
                            </span>
                            <span class="text">Delete Entry</span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <table class="display expandable-table" id="dt_entries" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th><input type='checkbox' onchange="checkAll(this, 'dt_id')"></th>
                            <th></th>
                            <th>Date</th>
                            <th>Reference</th>
                            <th>Product</th>
                            <th>No. of Batches</th>
                            <th>Status</th>
                            <th>Date Added</th>
                            <th>Date Modified</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</div>
<?php require_once 'modal_job_order.php'; ?>
<?php require_once 'modal_print.php'; ?>
<script type="text/javascript">
    function printRecord(id) {
        $("#tb_id").html("");
        $("#modalPrint").modal('show');
        $.ajax({
            type: 'POST',
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=getJobOrderHeader",
            data: {
                id: id
            },
            success: function(data) {
                var json = JSON.parse(data);
                // // console.log(json.data[0].customer_name);
                $("#product_name_span").html(json.data[0].product_name);
                $("#reference_span").html(json.data[0].reference_number);
                $("#no_of_batches_span").html(json.data[0].no_of_batches);
                $("#date_span").html(json.data[0].jo_date);
                getJobOrderDetails(json.data[0].job_order_id);
            }
        });
    }

    function getJobOrderDetails(id) {

        $.ajax({
            type: 'POST',
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=getJobOrderDetails",
            data: {
                id: id
            },
            success: function(data) {
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                while (i < arr_count) {
                    console.log(json.data[i]);
                    $("#tb_id").append('<tr>' +
                        '<td>' + json.data[i].product_name + '</td>' +
                        '<td>' + json.data[i].qty + '</td>' +
                        '<td>' + json.data[i].cost + '</td>' +
                        '</tr>');
                    i++;
                }

            }
        });
    }

    function getEntries() {
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data"
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? '' : "<input type='checkbox' value=" + row.job_order_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        if (row.status == 'F') {
                            var display = "";
                        } else {
                            var display = "display: none;";
                        }

                        return '<div class="dropdown">' +
                            '<button class="btn btn-primary dropdown-toggle me-1 btn-sm" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog"></i>' +
                            '</button><div class="dropdown-menu" aria-labelledby="dropdownMenuButton">' +
                            '<a class="dropdown-item" href="#" onclick="getEntryDetails2(' + row.job_order_id + ')"><span class="bi bi-pencil-square"></span> Edit Record</a>' +
                            '<a class="dropdown-item" href="#" style="' + display + '" onclick="printRecord(' + row.job_order_id + ')"><span class="fa fa-print"></span> Print Record</a>' +
                            '</div>';
                    }
                },
                {
                    "data": "job_order_date"
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "product"
                },
                {
                    "data": "no_of_batches"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? "<span class='badge badge-success'>Finish</span>" : "<span class='badge badge-danger'>Saved</span>";
                    }
                },
                {
                    "data": "date_added"
                },
                {
                    "data": "date_last_modified"
                }
            ]
        });
    }


    function getEntries2() {
        var params = "job_order_id = '" + $("#hidden_id_2").val() + "'";
        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_detail",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        param: params
                    }
                }
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.jo_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "data": "product"
                },
                {
                    "data": "qty"
                },
                {
                    "data": "cost"
                }
            ]
        });
    }

    function getProductCost() {
        var id = $("#product_id").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
            data: {
                input: {
                    id: id
                }
            },
            success: function(data) {
                var jsonParse = JSON.parse(data);
                const json = jsonParse.data;
                $("#cost").val(json.cost);
            }
        });
    }

    $('#modalEntry').on('shown.bs.modal', function(e) {})

    $(document).ready(function() {
        schema();
        getEntries();
        getSelectOption('Products', 'finished_product_id', 'product_name', "is_package = 1");
        getSelectOption('Products', 'product_id', 'product_name');
    });
</script>