import { h, app } from 'hyperapp'
import { Http } from 'hyperapp-fx'

import { ListMenu } from 'components/ListMenu'
import { List } from 'components/List'
import { Modal } from 'components/Modal'

indexList = (node) =>
  url = node.getAttribute('data-url')

  gotList = (state, response) => {
    state...
    response...
  }

  view = (state) =>
    <div>
      <ListMenu {state...} />
      <List
        targets={state.targets?.index}
        attrs={state.model?.attrs}
        items={state.items}
        selected_item={state.selected_item}
      />
    </div>

  app {
    init: [
      {
        url
        selected_item: null
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
