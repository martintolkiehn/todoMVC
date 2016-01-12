{expect} = require 'chai'
Actions = require '../actions'
ActionTypes = require '../action-types'

describe 'todo actions', ->
  it 'add todo action', ->
    text = 'Milch holen'
    actualAction = Actions.addToDo text
    expectedAction =
      type: ActionTypes.ADD_TODO
      text: text

    expect(actualAction).to.deep.equal(expectedAction)
