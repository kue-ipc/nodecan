import { h } from 'hyperapp'

# Actions

SelectRow = (state, item) => {
  state...
  selected_item: item
}

# Views

ListHead = ({targets, attrs}) =>
  ths = targets?.map (name) =>
    <th scope='col'>
      {attrs?[name]?.human}
    </th>

  <thead>
    <tr>
      {ths}
    </tr>
  </thead>

ListBody = ({targets, attrs, items, selected_item}) =>
  rows = items?.map (item) =>
    <ListRow targets={targets} attrs={attrs} item={item} selected={item.id == selected_item?.id}/>
  <tbody>
    {rows}
  </tbody>

ListRow = ({targets, attrs, item, selected, ctx = null}) =>
  tds = targets.map (name) =>
    <td>
      {item[name]}
    </td>
  classes = []
  classes.push 'table-active' if selected
  classes.push "table-#{ctx}" if ctx

  <tr class={classes} draggable={true} onClick={[SelectRow, item]}>
    {tds}
  </tr>

export List = ({targets, attrs, items, selected_item}) =>
  <table class="table table-responsive">
    <ListHead targets={targets} attrs={attrs} />
    <ListBody targets={targets} attrs={attrs} items={items} selected_item={selected_item} />
  </table>

