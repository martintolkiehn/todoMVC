chai = require 'chai'
chaiAsPromised = require('chai-as-promised')
chai.use(chaiAsPromised)
expect = chai.expect

port = 3003
baseUrl = "http://127.0.0.1:#{port}/"
browser.driver.get "#{baseUrl}/index.html"
browser.driver.ignoreSynchronization = true

findElement = browser.driver.findElement.bind browser.driver
findElements = browser.driver.findElements.bind browser.driver
findElementByCss = (cssSelector) -> findElement(By.css(cssSelector))
findElementsByCss = (cssSelector) -> findElements(By.css(cssSelector))
getElementTextByCss = (cssSelector) -> findElementByCss(cssSelector).getText()
getElementAttributeByCss = (cssSelector, attributeName) -> findElementByCss(cssSelector).getAttribute(attributeName)

initialTodos = [
  {
    id: 1
    text: 'Milch holen'
    completed: false
  }
  {
    id: 2
    text: 'Müll runter tragen'
    completed: true
  }
  {
    id: 3
    text: 'Oma Bescheid sagen'
    completed: false
  }
  {
    id: 4
    text: 'Ticket buchen'
    completed: true
  }
]

describe 'browser integration', ->

  it 'should have a root component', (done) ->
    expect(findElementByCss('#root')).to.exist
    done()

  it 'should have a todoApp component', (done) ->
    expect(getElementTextByCss('.todoApp')).to.exist
    done()

  it 'should have a next component in header with text MVC', (done) ->
    expect(getElementTextByCss('span.next')).to.eventually.equal 'MVC'
    done()

  it 'should have an input element in header', (done) ->
    expect(getElementAttributeByCss('.newTodo', 'placeholder')).to.eventually.equal 'add your todo here!'
    done()

  it 'has a section todo list', (done) ->
    expect(getElementTextByCss('section.todoList')).to.exist
    done()

  it 'should have a footer for filtering', (done) ->
    expect(getElementTextByCss('.filterFooter')).to.exist
    done()

  describe 'todo list', ->
    listElement = findElementByCss('section.todoList ul')

    it 'should have a list of todos', (done) ->
      expect(listElement).to.exist
      done()

    it "should have a list of initial todos with text Milch holen", (done) ->
      childs = listElement.findElements(By.css('li label span'))
      childs.then((list) ->
        expect(list[0].getText()).to.eventually.equal 'Milch holen'
        done()
    )

    for idx in [0...initialTodos.length]
      do (_idx = idx) ->
        todoText = initialTodos[_idx].text
        it "should have a list of initial todos with text #{todoText}", (done) ->
          childs = listElement.findElements(By.css('li label span'))
          childs.then((list) ->
            expect(list[_idx].getText()).to.eventually.equal todoText
            done()
        )
