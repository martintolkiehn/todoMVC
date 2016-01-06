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

function toggleTaskCompletion(state, position) {
  if (position >= state.length) {
    return state;
  }
  if (state[position].completed) {
    return uncompleteTask(state, position);
  } else {
    return completeTask(state, position);
  }
}

function deleteAllCompletedTasks(state) {
  return immutable.List(state).filter(function(task){
    return !task.completed;
  }).toJS();
}

module.exports = {
  "addTask": addTask,
  "deleteTask": deleteTask,
  "completeTask": completeTask,
  "uncompleteTask": uncompleteTask,
  "toggleTaskCompletion": toggleTaskCompletion,
  "deleteAllCompletedTasks": deleteAllCompletedTasks
}
