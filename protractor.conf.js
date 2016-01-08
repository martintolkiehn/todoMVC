exports.config = {
    specs: [
      'test/client*.coffee'
    ],
    
    multiCapabilities: [{
      'browserName': 'firefox'
    }],
    
    baseUrl: 'http://localhost:3000',
    
    framework: 'mocha'
};