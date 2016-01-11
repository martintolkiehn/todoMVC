var React = require('react');

var Task = React.createClass({
  render: function() {
    return React.createElement('li', {}, this.props.name);
  }
});

module.exports = {
  'Task': Task
};
