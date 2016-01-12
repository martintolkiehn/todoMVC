var React = require('react');

var Header = React.createClass({
  render: function() {
    return React.createElement('h1', {key: this.props.key}, this.props.name);
  }
});

module.exports = {
  'Header': Header
};
