# Technologien
die bei der Erstellung der todoMVC-Anwendung verwendet bzw. untersucht wurden

## Grundlagen

* _git_  
  ist ein Versionsverwaltungsprogramm
  - verwaltet Dateien in einem Repository
  - kann mit dem Programm SourceTree grafisch bedient werden
  - Link: <https://github.com/>
  - Link: <https://de.atlassian.com/software/sourcetree/overview>

* _javascript_  
  ist eine Skriptsprache, die ursprünglich für dynamisches HTML in Webbrowsern entwickelt wurde
  - Link: <https://de.wikipedia.org/wiki/JavaScript>
  - Link (ECMA standardisierter Sprachkern von JavaScript): <https://en.wikipedia.org/wiki/ECMAScript>
  
* _coffeescript_  
  ist ein Modul zum Übersetzen der Coffee-Script-Syntax in Java-Script-Syntax (Präprozessor)
  - Link: <http://coffeescript.org/>  
  - Link (javascript in coffeescript umwandeln): <http://js2.coffee/>
  
* _node.js_  
  ist eine serverseitige Plattform zum Betrieb von Netzwerkanwendungen, z.B. Webserver
  - muss installiert werden
  - enthält einige Module, die direkt in das Binärpaket kompiliert wurden. Dazu gehören neben dem Modul für asynchronen          Netzwerkzugriff auch Adapter für das Dateisystem, Puffer, Zeitgeber und eine allgemein gehaltene Datenstrom-Klasse.
  - enthält den Paketmanager npm zur Verwaltung von Modulen. In dessen Depot befinden sich über 185.000 Pakete (September        2015). Er sorgt, unter Berücksichtigung von Abhängigkeiten, für die Installation, Aktualisierung und das Kompilieren von     Binärmodulen.
  - Link: <https://nodejs.org/en/docs/>
  - Link (npm): <https://docs.npmjs.com/getting-started/what-is-npm>
  
## Test-Frameworks

* _mocha.js_  
  ist ein Modul für Unit-Tests
  - Link: <https://mochajs.org/#getting-started>

* _chai.js_  
  ist ein Modul zum Formulieren von Erwartungen
  - Link: <http://chaijs.com/api/bdd/>
  - Link: <http://chaijs.com/guide/>
  
## Webserver

* _express.js_  
  ist ein Webserver
  - Link: <http://expressjs.com/>

## Redux/React

* _redux.js_  
  ist ein Modul zum Verwalten von Datenmodellen
  - hat immer einen unveränderbaren Ausgangszustand
  - liefert über einen sog. reducer einen unveränderbaren Ergebniszustand, der alle Änderungen am Datenmodell zusammenfasst
  - Link: <http://redux.js.org/>
  - Link (flux): <https://facebook.github.io/flux/docs/todo-list.html>
  - Link (test): <http://redux.js.org/docs/recipes/WritingTests.html>

* _react.js_  
  ist ein Modul, das Komponenten (html-Elemente) in einem virtuellen DOM erzeugen (rendern) kann
  - Beispiele verwenden häufig JSX-Syntax mit html-Fragmenten, die mit Hilfe eines Präprozessors in JavaScript übersetzt werden können
  - Link: <https://facebook.github.io/react/>
  - Link: <https://facebook.github.io/react/docs/tutorial.html>
  - Link: <https://facebook.github.io/jest/docs/tutorial-react.html>
  - Link: <https://github.com/facebook/react>
  - Link: <https://github.com/facebook/react/tree/master/examples>
  - Link: <https://github.com/tastejs/todomvc/blob/gh-pages/examples/react/index.html>
  - Link (test-utils): <https://facebook.github.io/react/docs/test-utils.html>
  - Link (test/mocha/jsdom): <https://github.com/jesstelford/react-testing-mocha-jsdom>
  - Link (react/redux): <https://github.com/rackt/redux>
  - Link (react/redux): <http://rackt.org/redux/docs/introduction/Examples.html>
  - Link (react/redux/test): <http://rackt.org/redux/docs/recipes/WritingTests.html>
  - Link (react/redux): <https://github.com/rackt/redux/tree/master/examples/todomvc>
  - Link (redux-immutable): <https://github.com/gajus/redux-immutable>
  - Link (r-dom): <https://github.com/uber/r-dom>

## Module Loader
* [require.js](http://stuk.github.io/require1k/)
* [require.js](http://requirejs.org/docs/start.html)

## Asynchrone Operationen
* [promises](http://alexperry.io/node/2015/03/25/promises-in-node.html)

## REST-Service
* [REST](https://thewayofcode.wordpress.com/2013/04/21/how-to-build-and-test-rest-api-with-nodejs-express-mocha/)

## End-To-End-Test
* [karma](http://karma-runner.github.io/0.13/config/browsers.html)
* [karma](http://karma-runner.github.io/0.13/intro/configuration.html)

* [protractor](https://angular.github.io/protractor/#/tutorial)
* [protractor](http://www.heise.de/developer/artikel/End-to-End-Tests-mit-Protractor-2461535.html)
* [protractor/example](http://litutech.blogspot.de/2014/02/an-example-of-use-of-protractor-with.html)
* [protractor/mocha](http://byverdu.github.io/e2e-tests-with-protractor-and-mocha/)
* [protractor](https://github.com/angular/protractor/blob/master/docs/locators.md)

## Continuous Integration
* [travis](https://docs.travis-ci.com/user/for-beginners)
* [travis/todoMVC](https://travis-ci.org/martintolkiehn/todoMVC)
* [travis/heroku](https://docs.travis-ci.com/user/deployment/heroku/)
* [heroku/todoMVC](https://sleepy-citadel-1699.herokuapp.com/)

## NO-SQL Datenbank
* [couchbase](http://developer.couchbase.com/guides-and-references)

## Code-Qualität
* [kiss/dry/yagni/tdd](http://compositecode.com/2008/06/16/kiss-dry-soc-yagni-tdd/)
