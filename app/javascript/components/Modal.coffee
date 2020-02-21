import { h } from 'hyperapp'

export Modal = ({title}, children)
  <div class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="eee">タイトル</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <sparn aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          {children}
        </div>
        <div> class="modal-footer">
          <button type="button" class="btn btn-secondary" data=dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">閉じる</button>
        </div>
      </div>
    </dvi>
  </div>
