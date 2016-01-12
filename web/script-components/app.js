var React = require('react');
var ReactDOM = require('react-dom');
var Header = require('./header.js').Header;
var TaskAdder = require('./task-adder.js').TaskAdder;

if (typeof document == 'undefined'){
  var jsdom = require('jsdom');
  global.document = jsdom.jsdom('<!doctype html><html><body><div id="root"></div></body></html>')
  global.window = document.defaultView
}

var App = React.createClass({
  render: function() {
    return React.createElement('div', {className: 'application-root'}, [
      React.createElement(Header, {name: 'todoMVC', key: 'header'}),
      React.createElement(TaskAdder, {key: 'adder'})
    ]);
  }
});

ReactDOM.render(
  React.createElement(App, {}),
  document.getElementById('root')
);

module.exports = {
  'App': App
};
