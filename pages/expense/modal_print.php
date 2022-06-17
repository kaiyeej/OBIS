 <div class="modal fade bd-example-modal-lg" id="modalPrint" aria-labelledby="myModalLabel">
     <div class="modal-dialog  modal-lg" style="margin-top: 50px;" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Print Record</h4>
             </div>
             <div class="modal-body" style="padding: 15px;">
                 <input type="hidden" id="hidden_id_sales" name="input[sales_id]">
                 <div class="col-12" id="print_canvas">
                     <center><strong>
                             <h4>Order Biling and Inventory System</h4>
                         </strong></center>
                     <center><strong>Reference Number: </strong><span id="reference_number_span"></span></center>
                     <center><strong>Date: </strong><span id="expense_date_span"></span></center>
                     <center><strong>Remarks: </strong><span id="remarks_span"></span></center>
                     <div class="table-responsive">
                         <table class="table table-bordered mb-0" id="tbl_sales_details">
                             <thead>
                                 <tr>
                                     <th>EXPENSE</th>
                                     <th>SUPPLIER</th>
                                     <th>REMARKS</th>
                                     <th>AMOUNT</th>

                                 </tr>
                             </thead>
                             <tbody id="tb_id">



                             </tbody>
                         </table>
                     </div>
                     <br style="clear: both;" />
                     <div class="col-12 mt-5">
                         <label style="float: left;"><strong>Prepared By: </strong><span style="border-top: 1px solid"><?= $_SESSION['user_fullname'] ?></span></label>
                         <!-- <label style="float: right;"><strong>Reference Number: </strong><span id="reference_number_span"></span></label> -->
                     </div>
                 </div>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-sm" data-bs-dismiss="modal">
                     <i class="bx bx-x d-block d-sm-none"></i>
                     <span class="d-none d-sm-block">Close</span>
                 </button>
                 <button type="button" onclick="printCanvas()" class="btn btn-primary ml-1 btn-sm">
                     <i class="bx bx-check d-block d-sm-none"></i>
                     <span class="d-none d-sm-block">Print</span>
                 </button>
             </div>
         </div>
     </div>
 </div>