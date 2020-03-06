import { h } from 'hyperapp'
import { request } from '@hyperapp/http'

import { Modal } from './Modal'
import { FormInput } from './FormInput'


NewButtonClick = (state) =>
  modal = new bsn.Modal(document.getElementById('modal-new-form'))
  modal.show()
  {
    state...
    selected_item: null
  }

# CreateButtonClick = state => [
#   state
#   request {
#     url:
#     expect: 'json'
#     action: ...
#     options: ...
#   }
# ]

NewButton = ({targets, model}) =>
  buttons = [
    
  ]

  [
    <button type="button" class="btn btn-primary mr-2" onClick={NewButtonClick}>新規作成</button>
    <Modal id="modal-new-form" title={"#{model?.human}新規作成"}>
      <form action="categories" accept-charset="UTF-8" method="post">
        {targets.map (name) => <FormInput prefix="modal-new-form-" name={name} model={model} />}
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

export ListMenu = ({acl, targets, model, selected_item}) =>
  buttons = []
  if acl?.create
    buttons.push <NewButton targets={targets?.create} model={model} />
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
