<form method='POST' id='frm_upload_img_product' class="customers">
    <div class="modal fade" id="modalUpload" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Upload Image</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[product_id]">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">

                                    <!-- Basic file uploader -->
                                    <div class="filepond--root basic-filepond filepond--hopper" data-style-button-remove-item-position="left" data-style-button-process-item-position="right" data-style-load-indicator-position="right" data-style-progress-indicator-position="right" data-style-button-remove-item-align="false" style="height: 76px;">
                                        <input class="filepond--browser" type="file" id="filepond--browser-xf7wd1apw" name="filepond" aria-controls="filepond--assistant-xf7wd1apw" aria-labelledby="filepond--drop-label-xf7wd1apw" accept="">
                                        <div class="filepond--drop-label" style="transform: translate3d(0px, 0px, 0px); opacity: 1;"><label for="filepond--browser-xf7wd1apw" id="filepond--drop-label-xf7wd1apw" aria-hidden="true">Drag &amp; Drop your files or <span class="filepond--label-action" tabindex="0">Browse</span></label></div>
                                        <div class="filepond--list-scroller" style="transform: translate3d(0px, 0px, 0px);">
                                            <ul class="filepond--list" role="list"></ul>
                                        </div>
                                        <div class="filepond--panel filepond--panel-root" data-scalable="true">
                                            <div class="filepond--panel-top filepond--panel-root"></div>
                                            <div class="filepond--panel-center filepond--panel-root" style="transform: translate3d(0px, 8px, 0px) scale3d(1, 0.6, 1);"></div>
                                            <div class="filepond--panel-bottom filepond--panel-root" style="transform: translate3d(0px, 68px, 0px);"></div>
                                        </div><span class="filepond--assistant" id="filepond--assistant-xf7wd1apw" role="status" aria-live="polite" aria-relevant="additions"></span>
                                        <fieldset class="filepond--data"></fieldset>
                                        <div class="filepond--drip"></div>
                                    </div>
                                </div>
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