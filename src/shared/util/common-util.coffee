module.exports =
  defineConstants: (names = [], targetContext = {}) ->
    targetContext['_ALL_'] = names
    for name in names
      targetContext[name] = name
    targetContext

  isValidConstant: (name = '', constantDefinitionContext = {}) ->
    constantDefinitionContext[name] == name

  reduce: (startValue, iterable, reduceFn) ->
    reducedValue = startValue
    for value in iterable
      reducedValue = reduceFn(reducedValue, value)
    reducedValue
