import { h } from 'hyperapp'

New = (state) => {
  state...
  modal: true
  object: null
}

OpenButton = ({selectedId}) =>
  <button type="button" class="btn btn-info mr-2">開く/編集</button>

DeleteButton = ({selectedUrl}) =>
  <button type="button" class="btn btn-danger mr-2">削除</button>

UpAndDownButton = ({selectedId}) =>
  # fragmentはだめみたい？？？ babelのバグ？
  <span>
    <button type="button" class="btn btn-secondary mr-2">上</button>
    <button type="button" class="btn btn-secondary mr-2">下</button>
  </span>

NewButton = () =>
  <button type="button" class="btn btn-primary ml-2">
    新規作成
  </button>


export ListMenu = ({selectedId, acl}) =>
  buttons = []
  if acl.read
    buttons.push <OpenButton />
  if acl.delete
    buttons.push <DeleteButton />
  if acl.update
    buttons.push <UpAndDownButton />
  if acl.create
    buttons.push <NewButton />

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
