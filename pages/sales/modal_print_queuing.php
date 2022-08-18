<div class="modal fade bd-example-modal-lg" id="modalQueuing" aria-labelledby="myModalLabel">
    <div class="modal-dialog  modal-lg" style="margin-top: 50px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalLabel"><span class='fa fa-print'></span> Print Record</h4>
            </div>
            <div class="modal-body" style="padding: 15px;">
                <div class="col-12" id="print_queuing">
                    <center style="font-size: 12px;">
                    <strong>BeanBrewing Café </strong><br>
                    <span class="reference_number_span"></span><br>
                    <span class="sales_date_span"></span><br><br><br>

                    <h5>Your token number is</h5>
                    <strong style="font-size: 100px;"><span class="sales_q_num"></span></strong>
                </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">Close</span>
                </button>
                <button type="button" onclick="print_queuing()" class="btn btn-primary ml-1 btn-sm">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">Print</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
function print_queuing() {
    var printContents = document.getElementById('print_queuing').innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
    window.close();
    location.reload();

}
</script>