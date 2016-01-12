var module = {exports: {}};
var require = {};
var registerModule = {};

(function() {
  var _React = React;
  var _ReactDOM = ReactDOM;
  var _Redux = Redux;
  var _ReactRedux = ReactRedux;
  var moduleRegistry = {};

  require = function(name) {
    switch (name) {
      case 'react':
        return _React;
      case 'react-dom':
        return _ReactDOM;
      case 'redux':
        return _Redux;
      case 'react-redux':
        return _ReactRedux;
      default:
        var module = moduleRegistry[name];
        return module ? module : {};
    }
  };

  registerModule = function(name) {
    for (var i = 0; i < arguments.length; i++) {
      var name = arguments[i];
      moduleRegistry[name] = module.exports;
    }
    module = {exports: {}};
  }
})();
