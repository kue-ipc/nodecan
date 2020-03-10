import { h } from 'hyperapp'

CloseModal = (state) =>
  {
    state...
    modal: null
  }

export ModalBackdrop = ({fade = false, backdrop = 'static'}) =>
  classList = ['modal-backdrop', 'show']
  classList.push('fade') if fade
  <div class={classList}></div>

export Modal = ({modal, id, fade = false, title, size, buttons = [], backdrop = 'static'}, children) =>
  labelId = "#{id}-title"

  classList = ['modal']
  classList.push('fade') if fade

  params = {
    tabindex: '-1'
    role: 'dialog'
  }

  background = ''


  if modal == id
    classList.push('show')
    params['style'] = {display: 'block'}
    params['aria-model'] = true
    background = <ModalBackdrop fade={fade} backdrop={backdrop} />

  else
    params['style'] = {display: 'none'}
    params['aria-hidden'] = true


  [
    <div id={id} class={classList} aria-labelledby={labelId} data-backdrop={backdrop} {params...}>
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 id={labelId} class="modal-title">{title}</h5>
            <button type="button" class="close" aria-label="Close" onClick={CloseModal}>
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            {children}
          </div>
          <div class="modal-footer">
            {[
              buttons
              <button type="button" class="btn btn-secondary"  onClick={CloseModal}>閉じる</button>
            ]}
          </div>
        </div>
      </div>
    </div>
    background
  ]
