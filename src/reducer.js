Core = require('./core');

function reduce(state, action) {
  if (!state || typeof state != 'object' || state.constructor.name != 'Array') {
    return Core.INITIAL_STATE;
  }
  switch(action.type) {
    case 'ADD_NEW_TASK':
      return Core.addTask(state, action.name);
    default:
      return state;
  }
}

module.exports = {
  "reduce": reduce
};
