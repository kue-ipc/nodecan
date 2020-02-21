import { h } from 'hyperapp'

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

ListBody = ({attrs, list}) =>
  rows = list.map (row) => <ListRow attrs={attrs} row={row} />
  <tbody>
    {rows}
  </tbody>

ListRow = ({attrs, row}) =>
  tds = attrs.map (attr) =>
    <td>
      {row[attr]}
    </td>

  <tr>
    {tds}
  </tr>

export List = ({attrs, head, list}) =>
  <table class="table">
    <ListHead attrs={attrs} head={head} />
    <ListBody attrs={attrs} list={list} />
  </table>

