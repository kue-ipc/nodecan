import { h } from 'hyperapp'

export Modal = ({id, show = false, fade = true, title, size, buttons = [], backdrop = 'static'}, children) =>
  labelId = "#{id}-title"

  classList = ['modal']
  params = {
    tabindex: '-1'
    role: 'dialog'
  }

  classList.push('fade') if fade

  if show
    classList.push('show')
    params['style'] = {dpsiplay: 'block'}
    params['aria-model'] = true
  else
    params['style'] = {dpsiplay: 'none'}
    params['aria-hidden'] = true


  <div id={id} class={classList} aria-labelledby={labelId} data-backdrop={backdrop} {params...}>
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
