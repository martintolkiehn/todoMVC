var immutable = require("immutable");

function addTask(state, taskName) {
  return immutable.List(state).push({name:taskName}).toJS();
}

function deleteTask(state, position) {
  return immutable.List(state).delete(position).toJS();
}

module.exports = {
  "addTask": addTask,
  "deleteTask": deleteTask
}
