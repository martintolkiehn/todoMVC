module.exports =
  defineConstants: (names = [], targetContext = {}) ->
    targetContext['_ALL_'] = names
    for name in names
      targetContext[name] = name
    targetContext

  isValidConstant: (name = '', constantDefinitionContext = {}) ->
    constantDefinitionContext[name] == name
