var React = require('react');
var ReactDOM = require('react-dom');

/*if (typeof document == 'undefined'){
  var jsdom = require('jsdom');
  global.document = jsdom.jsdom('<!doctype html><html><body><div id="root"></div></body></html>')
  global.window = document.defaultView
}*/

var TaskAdder = React.createClass({
  render: function() {
    return React.createElement('input', {type:'text'});
  }
});

ReactDOM.render(
  React.createElement(TaskAdder, {}),
  document.getElementById('root')
);

module.exports = {
  'TaskAdder': TaskAdder
};
