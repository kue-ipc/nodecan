import { h } from 'hyperapp'

New = (state) => {
  state...
  modal: true
  object: null
}


export ListMenu = ({selectedId, acl}) =>
  <div class="mb-2">
    <button type="button" class="btn btn-info mr-2">開く/編集</button>
    <button type="button" class="btn btn-danger mr-2">削除</button>
    <button type="button" class="btn btn-secondary mr-2">上</button>
    <button type="button" class="btn btn-secondary mr-2">下</button>
    |
    <button type="button" class="btn btn-primary ml-2" onClick={New}>
      新規作成
    </button>
  </div>
