{expect} = require 'chai'
state = require '../src/state'

describe 'state test', ->
  describe 'we have a state', ->
    it 'state exists', -> expect(state).to.exist
