describe 'test client', ->

  it 'test correct title exists', ->
    browser.get 'index.html'
    expect(browser.getTitle()).toEqual('todoMVC');
