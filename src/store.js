var Redux = require("redux");
var Reducer = require("./reducer");

function makeStore() {
  return Redux.createStore(Reducer.reduce);
}

module.exports = {
  'makeStore': makeStore
};
