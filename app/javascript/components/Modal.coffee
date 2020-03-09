import { h } from 'hyperapp'

export Modal = ({id, fade = true, title, size, buttons = [], backdrop = 'static'}, children) =>
  labelId = "#{id}-title"
  classList = ['modal']
  classList.push('fade') if fade

  <div id={id} class={classList} tabindex="-1" role="dialog" aria-labelledby={labelId} aria-hidden="true" data-backdrop={backdrop}>
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 id={labelId} class="modal-title">{title}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          {children}
        </div>
        <div class="modal-footer">
          {[
            buttons
            <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
          ]}
        </div>
      </div>
    </div>
  </div>
