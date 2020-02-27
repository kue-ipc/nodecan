import { h } from 'hyperapp'

import { Modal } from './Modal'

New = (state) => {
  state...
  modal: true
  object: null
}


NewButtonClick = (state) =>
  modal = new bsn.Modal(document.getElementById('modal-new-form'))
  modal.show()
  {
    state...
    selectedItem: null
  }

NewButton = (humans) =>
  [
    <button type="button" class="btn btn-primary mr-2" onClick={NewButtonClick}>
      新規作成
    </button>
    <Modal id="modal-new-form" title="新規作成">
      <form>
        <div class="form-group row">
        <label for="" class="col-sm-2 col-form-label">
      </form>
    </Modal>
  ]

OpenButton = ({selectedItem}) =>
  <button type="button" class="btn btn-info mr-2" disabled={!selectedItem?}>開く/編集</button>

DeleteButton = ({selectedItem}) =>
  <button type="button" class="btn btn-danger mr-2" disabled={!selectedItem?}>削除</button>

UpAndDownButton = ({selectedItem}) =>
  [
    <button type="button" class="btn btn-secondary mr-2" disabled={!selectedItem?}>上</button>
    <button type="button" class="btn btn-secondary mr-2" disabled={!selectedItem?}>下</button>
  ]



export ListMenu = ({acl, selectedItem}) =>
  buttons = []
  if acl.create
    buttons.push <NewButton />
  if acl.read
    buttons.push <OpenButton selectedItem={selectedItem} />
  if acl.update
    buttons.push <UpAndDownButton selectedItem={selectedItem} />
  if acl.delete
    buttons.push <DeleteButton selectedItem={selectedItem} />

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
