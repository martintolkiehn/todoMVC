Core = require('./core');

function reduce(state, action) {
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
