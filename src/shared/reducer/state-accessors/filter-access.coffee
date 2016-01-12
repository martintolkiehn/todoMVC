{ isValidConstant } = require '../../util/common-util'
TaskFilter = require '../../action/task-filter'

module.exports =
  initialState: TaskFilter.SHOW_ALL

  isValid: (filterState) ->
    isValidConstant filterState, TaskFilter

  getFilter: (filterState) -> filterState

  setFilter: (filterState, filter) -> filter
