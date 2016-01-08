exports.config = {
    specs: [
      'test/client*.coffee'
    ],
    
    multiCapabilities: [{
      'browserName': 'firefox'
    }, {
      'browserName': 'chrome'
    }, {
      'browserName': 'phantomjs'
    }],
    
    baseUrl: 'http://localhost:3000',
    
    framework: 'mocha'
};