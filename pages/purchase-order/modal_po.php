<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[po_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Reference #</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[reference_number]" maxlength="30" id="reference_number" readonly required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Supplier</strong></label>
                            <div>
                                <select class="form-control" name="input[supplier_id]" id="supplier_id" required></select >
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                            <input type="date" class="form-control input-item" name="input[po_date]" id="po_date" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                            <textarea class="form-control input-item" name="input[remarks]" id="remarks" placeholder="Remarks" maxlength="255"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Close</span>
                    </button>
                    <button type="submit" class="btn btn-primary ml-1">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Submit</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>


<div class="modal fade bd-example-modal-lg" id="modalEntry2" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog  modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" style="display:block;">
                <div class="row" style="font-size: small;">
                    <div class="col-sm-4">
                        <div><b>Supplier:</b> <span id="supplier_name_label" class="label-item"></span></div>
                        <div><b>Remarks:</b> <span id="remarks_label" class="label-item"></span></div>
                        <div><b>Date:</b> <span id="po_date_label" class="label-item"></span></div>
                        <div><b>Reference:</b> <span id="reference_number_label" class="label-item"></span></div> 
                    </div>   
                    <div class="col-sm-8">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a id="menu-edit-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-pencil'></i> Edit Sales</a>
                            </li>
                            <li class="nav-item">
                                <a id="menu-delete-selected-items" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-trash'></i> Delete Selected Items</a>
                            </li>
                            <li class="nav-item">
                                <a id="menu-finish-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-check'></i> Finish Transaction</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-bs-dismiss="modal" style="font-size: small;"><i class='ti ti-close'></i> Close</a>
                            </li>
                            <!--<li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-4" id="col-item">
                        <form method='POST' id='frm_submit_2'>
                            <input type="hidden" id="hidden_id_2" name="input[po_id]">

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Product</strong></label>
                                    <div>
                                    <select class="form-control" name="input[product_id]" id="product_id" required></select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Qty</strong></label>
                                    <div>
                                        <input type="number" class="form-control" name="input[qty]" step=".01" min=0 id="qty" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <label><strong>Price</strong></label>
                                    <div>
                                        <input type="number" class="form-control" name="input[supplier_price]" step=".01" min=0 id="supplier_price" required>
                                    </div>
                                </div>
                            </div>
                            <div class='btn-group'style="float: right">
                                <button type="submit" class="btn btn-sm btn-info" id="btn_submit_2"><i class="bi bi-check2-circle"></i> Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-8" id="col-list">
                        <div class="table-responsive">
                            <table class="display expandable-table" id="dt_entries_2" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><input type='checkbox' onchange="checkAll(this, 'dt_id_2')"></th>
                                        <th>Product</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="4" style="text-align:right">Total:</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>