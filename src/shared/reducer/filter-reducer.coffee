ActionType = require '../action/action-type'
FilterAccess = require './state-accessors/filter-access'
{ isValidConstant } = require '../util/common-util'

module.exports =
  reduce: (filterState, action) ->

    if not FilterAccess.isValid filterState
      return FilterAccess.initialState

    if not isValidConstant action.type, ActionType
      return filterState

    switch action.type

      when ActionType.SET_TASK_FILTER
        return FilterAccess.setFilter action.filter

      else
        return filterState
