{expect} = require 'chai'
{List, Map} = require 'immutable'

{reduce} = require '../src/reducer'

describe 'reducer test', ->
  describe 'we have a reducer', ->
    it 'reducer exists', -> expect(reduce).to.exist
