var React = require('react');
var ReactDOM = require('react-dom');


var Header = React.createClass({
  render: function() {
    return React.createElement('h1', {}, this.props.name);
  }
});

module.exports = {
  'Header': Header
};
