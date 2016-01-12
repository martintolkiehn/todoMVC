{expect} = require 'chai'
React = require 'react'

{App} = require '../app'

describe 'app component', ->
  it 'should be a react component', ->

    expect(new App() instanceof React.Component).to.be.true
