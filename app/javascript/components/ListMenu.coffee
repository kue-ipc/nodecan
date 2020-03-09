import { h } from 'hyperapp'
import { request } from '@hyperapp/http'

import { Modal } from './Modal'
import { FormInput } from './FormInput'

CsrfInputHidden = () =>
  csrfParam = document.getElementsByName('csrf-param')[0].content
  csrfToken = document.getElementsByName('csrf-token')[0].content
  <input type="hidden" name={csrfParam} value={csrfToken} />

NewButtonClick = (state) =>
  modal = new bsn.Modal(document.getElementById('modal-new-form'))
  modal.show()
  {
    state...
    selected_item: null
  }

errorMessage = (state, error) =>
  {
    state...
    error
  }


responseError = (dispatch, response) =>
  message = await response.json()
  dispatch(errorMessage, message)

postItem = (state, response) =>
  state
  if response instanceof Response
    [
      state
      [responseError, response]
    ]
  else
    console.log('ok')
    modal = new bsn.Modal(document.getElementById('modal-new-form'))
    modal.hide()
    {
      state...
      items: state.items.concat(response)
    }


CreateButtonClick = (state, {formId}) =>
  form = document.getElementById(formId)
  data = new FormData(form)
  [
    state
    request {
      url: form.action
      expect: 'json'
      action: postItem
      options:
        method: form.method
        body: data
        mode: 'same-origin'
        credentials: 'same-origin'
    }
  ]

NewButton = ({url, targets, model}) =>
  formId = 'new-form'

  buttons = [
    <button class="btn btn-primary mr-2" type="button" onClick={[CreateButtonClick, {formId}]}>
      新規作成
    </button>
  ]

  [
    <button type="button" class="btn btn-primary mr-2" onClick={NewButtonClick}>新規作成</button>
    <Modal id={"modal-#{formId}"} title={"#{model?.human}新規作成"} buttons={buttons}>
      <form id={formId} action={url} accept-charset="UTF-8" method="post">
        <CsrfInputHidden />
        {targets.map (name) => <FormInput prefix={"#{formId}-"} name={name} model={model} />}
      </form>
    </Modal>
  ]

OpenButtonClick = (state) =>
  modal = new bsn.Modal(document.getElementById('modal-open-form'))
  modal.show()
  state

OpenButton = ({targets, writes, model, selected_item}) =>
  [
    <button type="button" class="btn btn-info mr-2" disabled={!selected_item?} onClick={OpenButtonClick}>
      開く/編集
    </button>
    <Modal id="modal-open-form" title={"#{model?.human}開く/編集"}>
      <form>
        {targets.map (name) =>
          <FormInput prefix="modal-open-form-" name={name} model={model} value={selected_item?[name]} readonly={!writes.includes(name)}/>
        }
      </form>
    </Modal>
  ]
 
DeleteButton = ({selected_item}) =>
  <button type="button" class="btn btn-danger mr-2" disabled={!selected_item?}>削除</button>

UpAndDownButton = ({selected_item}) =>
  [
    <button type="button" class="btn btn-secondary mr-2" disabled={!selected_item?}>上</button>
    <button type="button" class="btn btn-secondary mr-2" disabled={!selected_item?}>下</button>
  ]

export ListMenu = ({url, acl, targets, model, selected_item, error}) =>
  console.log '---erorr obj---'
  console.log error
  buttons = []
  if acl?.create
    buttons.push <NewButton url={url} targets={targets?.create} model={model} />
  if acl?.read
    buttons.push <OpenButton targets={targets?.read} writes={if acl?.update then targets?.update else []} model={model} selected_item={selected_item}/>
  if acl?.update
    buttons.push <UpAndDownButton selected_item={selected_item} />
  if acl?.delete
    buttons.push <DeleteButton selected_item={selected_item} />

  <div class="mb-2">
    {buttons}
  </div>



# <button type="button" class="btn btn-info mr-2">開く/編集</button>
# <button type="button" class="btn btn-danger mr-2">削除</button>
# <button type="button" class="btn btn-secondary mr-2">上</button>
# <button type="button" class="btn btn-secondary mr-2">下</button>
# |
# <button type="button" class="btn btn-primary ml-2" onClick={New}>
#   新規作成
# </button>
