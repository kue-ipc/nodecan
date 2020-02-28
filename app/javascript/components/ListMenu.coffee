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
    selected_item: null
  }

NewButton = (humans) =>
  [
    <button type="button" class="btn btn-primary mr-2" onClick={NewButtonClick}>
      新規作成
    </button>
    <Modal id="modal-new-form" title="新規作成">
      <form>
        <div class="form-group row">
          <label for="" class="col-sm-2 col-form-label">test</label>
        </div>
      </form>
    </Modal>
  ]

OpenButton = ({selected_item}) =>
  <button type="button" class="btn btn-info mr-2" disabled={!selected_item?}>開く/編集</button>

DeleteButton = ({selected_item}) =>
  <button type="button" class="btn btn-danger mr-2" disabled={!selected_item?}>削除</button>

UpAndDownButton = ({selected_item}) =>
  [
    <button type="button" class="btn btn-secondary mr-2" disabled={!selected_item?}>上</button>
    <button type="button" class="btn btn-secondary mr-2" disabled={!selected_item?}>下</button>
  ]

export ListMenu = ({acl, selected_item}) =>
  buttons = []
  if acl.create
    buttons.push <NewButton />
  if acl.read
    buttons.push <OpenButton selected_item={selected_item} />
  if acl.update
    buttons.push <UpAndDownButton selected_item={selected_item} />
  if acl.delete
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
