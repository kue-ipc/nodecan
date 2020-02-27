import { h } from 'hyperapp'

# Actions

SelectRow = (state, item) => {
  state...
  selectedItem: item
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

ListBody = ({attrs, list, selectedItem}) =>
  console.log selectedItem
  rows = list.map (row) => <ListRow attrs={attrs} row={row} selected={row.id == selectedItem?.id}/>
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

  <tr class={classes} draggable={true} onClick={[SelectRow, row]}>
    {tds}
  </tr>

export List = ({attrs, head, list, selectedItem}) =>
  <table class="table table-responsive">
    <ListHead attrs={attrs} head={head} />
    <ListBody attrs={attrs} list={list} selectedItem={selectedItem} />
  </table>

