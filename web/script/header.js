var React = require('react');
var ReactDOM = require('react-dom');

if (typeof document == 'undefined'){
  var jsdom = require('jsdom');
  global.document = jsdom.jsdom('<!doctype html><html><body><div id="test"></div></body></html>')
  global.window = document.defaultView
}

var Header = React.createClass({
  render: function() {
    return React.createElement('h1', {}, this.props.name);
  }
});

module.exports = {
  'Header': Header
};

ReactDOM.render(
  React.createElement(Header, {name: "todoMVC"}),
  document.getElementById('test')
);
