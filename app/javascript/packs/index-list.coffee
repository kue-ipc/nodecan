import {h, app} from 'hyperapp'
import {Http} from 'hyperapp-fx'

indexListEl = document.getElementById('index-list')
indexUrl = indexListEl.getAttribute('data-url')



gotList = (state, response) =>
  console.log response
  return {
    list: response
  }

view = (state) =>
  h 'ul', {},
    state.list.map (entry) ->
      h 'li', {}, entry.name



app({
  init: [
    {
      list: []
    },
    Http({
      url: indexUrl + '.json'
      response: 'json'
      action: gotList
    })
  ]
  view: view
  node: indexListEl
})

