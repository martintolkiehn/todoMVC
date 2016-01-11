var module = {exports: {}};
var require = {};
var registerModule = {};

(function() {
  var _React = React;
  var _ReactDOM = ReactDOM;
  var moduleRegistry = {};

  require = function(name) {
    switch (name) {
      case 'react':
        return _React;
      case 'react-dom':
        return _ReactDOM;
      default:
        var module = moduleRegistry[name];
        return module ? module : {};
    }
  };

  registerModule = function(name) {
    moduleRegistry[name] = module.exports;
    module = {exports: {}};
  }
})();
