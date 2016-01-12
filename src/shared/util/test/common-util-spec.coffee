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

  describe 'test method reduce', ->
    it 'reduces [1, 2, 3, 4] on start value 1 by sum to 11', ->
      iterable = [1, 2, 3, 4]
      startValue = 1
      targetValue = 11
      reduceFn = (a, b) -> a + b
      actualValue = reduce startValue, iterable, reduceFn
      expect(actualValue).to.equal(targetValue)

    it 'reduces [] on start value 42 by sum to 42', ->
      iterable = []
      startValue = 42
      targetValue = 42
      reduceFn = (a, b) -> a + b
      actualValue = reduce startValue, iterable, reduceFn
      expect(actualValue).to.equal(targetValue)
