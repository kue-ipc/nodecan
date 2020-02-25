import { h } from 'hyperapp'

# Actions

SelectRow = (state, id) => {
  state...
  selectedId: id
}

# Views

ListHead = ({attrs, head}) =>
  ths = attrs.map (attr) =>
    <th scope='col'>
      {head[attr]}
    </th>

  <thead>
    <tr>
      {ths}
    </tr>
  </thead>

ListBody = ({attrs, list, selectedId}) =>
  rows = list.map (row) => <ListRow attrs={attrs} row={row} selected={row.id == selectedId}/>
  <tbody>
    {rows}
  </tbody>

ListRow = ({attrs, row, selected, ctx = null}) =>
  tds = attrs.map (attr) =>
    <td>
      {row[attr]}
    </td>
  classes = []
  classes.push 'table-active' if selected
  classes.push "table-#{ctx}" if ctx

  <tr class={classes} draggable={true} onClick={[SelectRow, row.id]}>
    {tds}
  </tr>

export List = ({attrs, head, list, selectedId, select}) =>
  <table class="table">
    <ListHead attrs={attrs} head={head} />
    <ListBody attrs={attrs} list={list} selectedId={selectedId} />
  </table>

