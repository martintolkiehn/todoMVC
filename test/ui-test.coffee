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

describe 'browser integration', ->

  listElement = findElementByCss('section.todoList ul')

  describe 'index page html elements', ->
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

      it 'should have a list of todos', (done) ->
        expect(listElement).to.exist
        done()

      it "should have a list of initial todos with text Milch holen", (done) ->
        childs = listElement.findElements(By.css('li label span'))
        childs.then((list) ->
          expect(list[0].getText()).to.eventually.equal 'Milch holen'
          done()
      )

      it "should have a second element with text Müll runter tragen", (done) ->
        childs = listElement.findElements(By.css('li label span'))
        childs.then((list) ->
          expect(list[1].getText()).to.eventually.equal 'Müll runter tragen'
          done()
      )

      it "should have an unchecked checkbox with css class names uncheckedBox toggleCompletion at the first position", (done) ->
        childs = listElement.findElements(By.css('.toggleCompletion'))
        childs.then((list) ->
          expect(list[0].getAttribute('class')).to.eventually.equal 'uncheckedBox toggleCompletion'
          done()
        )

      it "should have an checked checkbox with css class names checkedBox toggleCompletion at the second position", (done) ->
        childs = listElement.findElements(By.css('.toggleCompletion'))
        childs.then((list) ->
          expect(list[1].getAttribute('class')).to.eventually.equal 'checkedBox toggleCompletion'
          done()
        )

      it "should have a toggleall button when at least one todo exists in the list", (done) ->
        expect(findElementByCss('.toggleAll')).to.exist
        done()

  describe 'browser integration with interactions', ->

    it "should change the state from unchecked to checked of first element in our list", (done) ->
      childs = listElement.findElements(By.css('.toggleCompletion'))
      childs.then (list) ->
        list[0].click().then () ->
          expect(list[0].getAttribute('class')).to.eventually.equal 'checkedBox toggleCompletion'
          done()
