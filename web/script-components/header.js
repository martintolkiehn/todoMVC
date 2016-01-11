var React = require('react');

var Header = React.createClass({
  render: function() {
    return React.createElement('h1', {}, this.props.name);
  }
});

module.exports = {
  'Header': Header
};
