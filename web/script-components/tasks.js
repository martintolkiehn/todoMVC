var React = require('react');
var Task = require('./task.js').Task;

var Tasks = React.createClass({
  render: function() {
    var taskModels = this.props.tasks;
    var taskElements = [];
    
    for (var i = 0; i < taskModels.length; i++) {
      var taskModel = taskModels[i];
      var taskElement = React.createElement(Task, {name: taskModel.name});
      taskElements.push(taskElement);
    }

    return React.createElement('ul', {}, taskElements);
  }
});

module.exports = {
  'Tasks': Tasks
};
