describe 'test client', ->
  port = 3000
  baseUrl = "http://127.0.0.1:#{port}/"

  it 'test correct title exists', ->
    #browser().navigateTo baseUrl + 'index.html'
    #browser().navigateTo 'http://www.golem.de'
    alert browser().location().url()
    #expect(element('title').text()).toBe('todoMVC')
    true
    
  it '2nd test', -> true
    