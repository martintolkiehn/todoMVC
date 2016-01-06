var immutable = require("immutable");

function addTask(oldState, taskName) {
    return immutable.List(oldState).push({name:taskName}).toJS();
}

module.exports = {
  "addTask": addTask
}
