{expect} = require 'chai'
simple = require '../src/simple'

describe 'simple testing', ->
  it 'incrementDay(0) is 1', -> expect(simple.incrementDay(0)).to.equal(1)
