import {h} from 'hyperapp'

ListHead = ({attrs, head}) =>
  h 'thead', {},
    h 'tr', {},
      attrs.map (attr) =>
        h 'th', scope: 'col', head[attr]

count = 0
ListBody = ({attrs, list}) =>
  h 'tbody', {},
    list.map (row) =>
      h ListRow, {attrs, row}

ListRow = ({attrs, row}) =>
  h 'tr', {},
    attrs.map (attr) =>
      h 'th', {}, row[attr]

export List = ({attrs, head, list}) =>
  h 'table', class: 'table', [
    h ListHead, {attrs, head}
    h ListBody, {attrs, list}
  ]

