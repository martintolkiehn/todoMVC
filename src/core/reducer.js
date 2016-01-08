Core = require('./core');

function reduce(state, action) {
  if (!state || typeof state != 'object' || state.constructor.name != 'Array') {
    return Core.INITIAL_STATE;
  }
  if (!action || !action.type) {
    return state;
  }
  switch(action.type) {
    case 'ADD_NEW_TASK': return Core.addTask(state, action.name);
    case 'RENAME_TASK': return Core.renameTask(state, action.position, action.name);
    case 'DELETE_TASK': return Core.deleteTask(state, action.position);
    case 'COMPLETE_TASK': return Core.completeTask(state, action.position);
    case 'UNCOMPLETE_TASK': return Core.uncompleteTask(state, action.position);
	  case 'TOGGLE_TASK_COMPLETION': return Core.toggleTaskCompletion(state, action.position);
    case 'DELETE_ALL_COMPLETED_TASKS': return Core.deleteAllCompletedTasks(state);
    default: return state;
  }
}

module.exports = {
  "reduce": reduce
};