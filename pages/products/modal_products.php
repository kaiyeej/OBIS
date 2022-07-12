<form method='POST' id='frm_submit' class="customers">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[product_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Product Code</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[product_code]" id="product_code" placeholder="Product Code" maxlength="100" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Name</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[product_name]" id="product_name" placeholder="Product Name" maxlength="75" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Category</strong></label>
                            <div>
                                <select class="form-control input-item select2" name="input[product_category_id]" id="product_category_id" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Type</strong></label>
                            <div>
                                <select class="form-control input-item select2" name="input[is_package]" id="is_package" required>
                                    <option value="">Please Select:</option>
                                    <option value="1">Finished Product</option>
                                    <option value="0">Ingredient</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Price</strong></label>
                            <div>
                                <input type="number" class="form-control input-item" name="input[product_price]" id="product_price" step=".01" min="0" required>
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