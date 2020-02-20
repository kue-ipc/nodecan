import {h, app} from 'hyperapp'
import {Http} from 'hyperapp-fx'

import {List} from 'components/List'

node = document.getElementById('index-list')

url = node.getAttribute('data-url')
attrs = JSON.parse(node.getAttribute('data-attrs'))
head = JSON.parse(node.getAttribute('data-head'))

gotList = (state, response) => {
  state...
  list: response
}

view = (state) =>
  h 'div', {},
    h List, {state...}

app {
  init: [
    {
      attrs
      head
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
