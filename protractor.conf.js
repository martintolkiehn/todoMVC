exports.config = {
    specs: [
      'test/client*.coffee'
    ],
    
    multiCapabilities: [{
      'browserName': 'firefox',
      'firefox_binary': process.env.FIREFOX_BIN
    }],
    
    baseUrl: 'http://localhost:3000',
    
    framework: 'mocha',
      
    allScriptsTimeout: 20000
};