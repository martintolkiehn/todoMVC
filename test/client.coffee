describe 'test client', ->
  port = 3000
  baseUrl = "http://127.0.0.1:#{port}/"

  it 'test correct title exists', ->
    browser().navigateTo '/index.html'
    expect(element('title').text()).toBe('todoMVC')
    
  it '2nd test', ->
    expect('Ulf').toBe('Olaf')
    
  it '3.', ->
    expect('Bruno').toBe('Karl-Heinz')
    
  it '4.', ->
    expect('Fidelius').toBe('Fidelius')
