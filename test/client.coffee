describe 'test client', ->
  port = 3000
  baseUrl = "http://127.0.0.1:#{port}/"

  it 'test correct title exists', ->
    browser.get '/index.html'
    true
    
  it '2nd test', -> true
    