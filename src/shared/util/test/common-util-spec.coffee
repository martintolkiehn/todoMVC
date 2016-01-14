{ expect } = require 'chai'

{
  defineConstants
  reduce
} = require '../common-util'

describe 'test common-util module', ->
  describe 'test method defineConstants', ->
    names = [
      'NAME1'
      'NAME_2'
    ]

    constants = defineConstants names

    it 'should NAME1 = "NAME1"', ->
      expect(constants.NAME1).to.equal('NAME1')

    it 'should NAME_2 = "NAME_2"', ->
      expect(constants.NAME_2).to.equal('NAME_2')
