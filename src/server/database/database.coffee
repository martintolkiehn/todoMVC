Promise = require 'bluebird'

dbModuleNames = [
  './couchbase/couchbase-db'
  './mocked/mocked-db'
]

dbModules = []
activeDbModule = null

initModulesProm = Promise.try -> true
for dbModuleName in dbModuleNames
  moduleInfo =
    name: dbModuleName
    exports: {}
    info:
      name: dbModuleName
      isAvailable: false
      error: null
  dbModules.push moduleInfo
  do (_moduleInfo = moduleInfo) ->
    try
      moduleExports = require _moduleInfo.name
      _moduleInfo.exports = moduleExports
      initModulesProm = initModulesProm.then(->
        moduleExports.getInfoAsync().then( (info) ->
          _moduleInfo.info = info
          console.log "checked db module '#{_moduleInfo.name}' info:", info
        )
      )
    catch error
      _moduleInfo.info.isAvailable = false
      _moduleInfo.info.error = error
      console.log 'problem on checking db module:', _moduleInfo

findFirstActiveDbModule = ->
  for dbModule in dbModules
    return dbModule if dbModule.info.isAvailable
  null


getAllDbModulesAsync = ->
  initModulesProm.then(->
    return dbModules
  )

getAvailableDbModulesAsync = ->
  initModulesProm.then(->
    return availableDbModules
  )

getActiveDbModuleAsync = ->
  initModulesProm.then(->
    unless activeDbModule?
      console.log 'no db module choosed!'
      activeDbModule = findFirstActiveDbModule()
      console.log 'choosed db module:', activeDbModule.info
    activeDbModule
  )

module.exports = {
  getAllDbModulesAsync
  getAvailableDbModulesAsync
  getActiveDbModuleAsync
}
