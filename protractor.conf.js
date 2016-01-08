exports.config = {
    specs: [
      'test/client*.coffee'
    ],
    
    multiCapabilities: [{
      'browserName': 'firefox',
      'firefox_binary': process.env.FIREFOX_BIN
    }],
    
    baseUrl: 'http://localhost:3000',
    
    framework: 'jasmine',
      
    allScriptsTimeout: 20000,

    jasmineNodeOpts: {
        isVerbose: true,
        showColors: true,
        includeStackTrace: true,
        defaultTimeoutInterval: 10000
    }
};