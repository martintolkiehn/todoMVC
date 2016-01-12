{ expect } = require 'chai'

TaskFilter = require '../../../action/task-filter'
FilterAccess = require '../filter-access'

describe 'test filter-access module', ->

  it 'test initial state', ->
    targetFilterState = TaskFilter.SHOW_ALL
    actualFilterState = FilterAccess.initialState
    expect(actualFilterState).to.deep.equal(targetFilterState)

  it 'test method isValid(initialState): true', ->
    validFilterState = FilterAccess.initialState
    isValid = FilterAccess.isValid validFilterState
    expect(isValid).to.equal(true)

  it 'test method isValid: true', ->
    validFilterState = TaskFilter.SHOW_UNCOMPLETED
    isValid = FilterAccess.isValid validFilterState
    expect(isValid).to.equal(true)

  it 'test method isValid: false', ->
    invalidFilterState = 'Karl-Heinz'
    isValid = FilterAccess.isValid invalidFilterState
    expect(isValid).to.equal(false)

  it 'test method getFilter', ->
    filterState = FilterAccess.initialState
    expectedFilter = TaskFilter.SHOW_ALL
    actualFilter = FilterAccess.getFilter filterState
    expect(actualFilter).to.equal(expectedFilter)
