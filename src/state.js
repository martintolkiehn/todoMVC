var immutable = require("immutable");

function addTask(state, taskName) {
  return immutable.List(state).push({name:taskName, completed: false}).toJS();
}

function deleteTask(state, position) {
  return immutable.List(state).delete(position).toJS();
}

function completeTask(state, position) {
  return immutable.List(state).update(position, function(task) {
    return immutable.Map(task).updateIn(['completed'], function(completed) { return true; });
  }).toJS();
}

function uncompleteTask(state, position) {
  return immutable.List(state).update(position, function(task) {
    return immutable.Map(task).updateIn(['completed'], function(completed) { return false; });
  }).toJS();
}

module.exports = {
  "addTask": addTask,
  "deleteTask": deleteTask,
  "completeTask": completeTask,
  "uncompleteTask": uncompleteTask
}
