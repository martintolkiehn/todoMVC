var React = require('react');

var TaskAdder = React.createClass({
  render: function() {
    return React.createElement('input', {type:'text'});
  }
});

module.exports = {
  'TaskAdder': TaskAdder
};
