import { h, app } from 'hyperapp'
import { Http } from 'hyperapp-fx'

import { ListMenu } from 'components/ListMenu'
import { List } from 'components/List'

indexList = (node) =>
  url = node.getAttribute('data-url')
  attrs = JSON.parse(node.getAttribute('data-attrs'))
  head = JSON.parse(node.getAttribute('data-head'))
  acl = JSON.parse(node.getAttribute('data-acl'))

  gotList = (state, response) => {
    state...
    list: response
  }

  view = (state) =>
    <div>
      <ListMenu {state...} />
      <List {state...} />
    </div>

  app {
    init: [
      {
        attrs
        head
        acl
        selectedId: undefined
        list: []
      },
      Http {
        url
        response: 'json'
        action: gotList
      }
    ]
    view
    node
  }

indexList(document.getElementById('index-list'))
