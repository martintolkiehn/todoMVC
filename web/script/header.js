var React = require('react');
var ReactDOM = require('react-dom');

if (typeof document == 'undefined'){
  var jsdom = require('jsdom');
  global.document = jsdom.jsdom('<!doctype html><html><body><div id="root"></div></body></html>')
  global.window = document.defaultView
}

var Header = React.createClass({
  render: function() {
    return React.createElement('h1', {}, this.props.name);
  }
});

ReactDOM.render(
  React.createElement(Header, {name: "todoMVC"}),
  document.getElementById('root')
);

module.exports = {
  'Header': Header
};
