var module = {exports: {}};
var require = function() {
  var _React = React;
  var _ReactDOM = ReactDOM;

  return function(name) {
    switch (name) {
      case 'react':
        return _React;
      case 'react-dom':
        return _ReactDOM;
      default:
        return {};
    }
  }
}();
