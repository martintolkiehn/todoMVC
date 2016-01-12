var React = require('react');

var TaskAdder = React.createClass({
  render: function() {
    return React.createElement('input', {type:'text', key: this.props.key});
  }
});

module.exports = {
  'TaskAdder': TaskAdder
};
