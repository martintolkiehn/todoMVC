Zusammenfassung der Einarbeitungs-Tage
======================================



# Day 0
Datum 05.01.2016

*  Aufteilung der initialen Arbeit
*  Aufsetzen eines Team-Github-Repository für Projekt TodoMVC mit allen Beteiligten als Collaborators
*  Grundsätzlicher Test des gemeinsamen Repositories (jeder Entwickler cloned, commited, pushed, pulled, merged einmal)

## Arbeits-Verteilung
*  Erarbeitung/Zusammenfassung der CleanCode-Namens-Grundregeln
*  Initiale Einarbeitung in React-Reduce
*  Findung Test-Framework für die TDD zu Kata-Punktes 1 (TodoMVC im Browser)
*  Github



# Day 1
Datum 06.01.2016

## Einrichtung Test-Framework im Projekt TodoMVC

*  Erklärung des Modul-Konzepts von node.js und des npm
*  Installations-Arten von benötigten Bibliotheken
   - npm install
   - lokal/global
   - Speicherung Dependencies in package.json
   - automatisches Laden aller Module durch npm install aufgrund der definierten Abhängigkeiten in package.json
*  Installation der Test-Bibliotheken und coffee-script
   (Wahl von Coffee-Script als Sprache für die Test-Spezifikation aufgrund der Einfachheit und Klarheit)
*  Aufsetzen von simplen Test
   Erklärung des grundsätzlichen Aufbaus des Test-Frameworks
   Erklärung von Coffee-Script-Syntax in dem Zusammenhang

### Test-Framework
*  mocha
*  chai
*  coffee-script
*  node.js

## Vorstellung der CleanCode-Namens-Regeln
*  Durschsprechen der einzelnen Regeln und deren Intention

## Beginn mit Implementation der Core-Applikations-Logik
*  Vorstellung der grundlegenden Prinzipien/Architektur-Merkmale von Redux
   unveränderliche Status-Objekte
   Status-Änderung durch Erstellung eines neuen validen Zustands aufgrund des alten Zustands und der Aktion mit Hilfe
   einer puren Reducer-Funktion
*  Schreiben eines ersten Tests
*  Starten des Tests -> rot
*  Implementation der zugehörigen Implementation
*  Starten des Tests und Fixes bis Test grün
*  commit des ersten validen Test-Zustandes
*  Wiederholung des Zykluses
*  mit TDD zyklische Implementierung der Core-Zustands-Funktionen zur Erstellung eines neuen Zustandes entsprechend
   der von TodoMVC benötigten Usecases
*  mit TDD zyklische Implementierung der Reducer-Funktion
*  Einführung des Round-Robin-Wechsels bei TDD-Implementierung pro Test/Implementations-Zyklus
   1 Driver, 1 Navigator, 2 Zuhörer/Fragesteller

## Diskussion mit Scrum-Master
*  Reflektion des Tages
*  Besprechung des groben Ziels für nächsten Tag
*  Beschluss die Erfahrungen in einem Day-Report zusammenzufassen und zur Verfügung zu stellen



# Day 2
Datum 07.01.2016
## Ablage der Dokumentation in Doc-Verzeichnis des TodoMVC-Projektes
*  Zusammenfassung von Day 0 und 1 im "Docs/Day-Report.md"
*  Ablage der [CleanCode-Namens-Regeln](https://github.com/martintolkiehn/todoMVC/blob/master/Docs/CleanCodeNames.md)

## Schritte im Kata
* Test und Erstellung eines Stores
* Test und Implementierung der Übergabe von Actions an den Store mit dispatch
* Refactoring der Package Struktur zur besseren Gliederung der Module
* Durchstich zu React
* Test und Implementierung eines Header-Elements mit React

## Installierte Packages
* jsdom (Erstellung eines virtuellen DOMs zum testen von React-Komponenten)
* chai-immutable (zum natürlichsprachlichen Testen von immutables)
* mocha-jsdom (testen des virtuellen DOMs)
* redux (flux machine)
* react (framework für die ui)
* coffee-react (react with coffee-script syntax)
* react-addons-test-utils {addons zum testen von react}

## Diskussion mit Scrum-Master
*  Reflektion des Tages
*  Besprechung des groben Ziels für nächsten Tag
*  Beschluss die Erfahrungen in einem Day-Report zusammenzufassen und zur Verfügung zu stellen

# Day 3
Datum 08.01.2016
## Browser Testing
* Karma ausprobiert, aber ungeeignet für e2e Tests und liefert keine stabilen Ergebnisse
* Stattdessen wurde protractor genommen, derzeit läuft die Integration in unserer Umgebung
* tl;dr: Wir versuchen den Durchstich an das Frontend Testing
* update: Erster möglicher Durchstich mit protractor und Zugriff über browser.driver direkt. Wichtiger Aspekt ist der, dass protractor für Nicht-Angular Applikationen anders zu [verwenden](https://github.com/sakshisingla/Protractor-Non-Angular-Tests/wiki/Creating-test-scripts-using-Protractor-for-non-angular-application) ist.
* update: Durchstich erfolgte mit Testabdeckung im Frontend mit protractor, sowie im backend mit npm

## Grooming session actano am Vormittag
* Kleine Einführung in das Grooming in großer Runde mit allen Scrummaster und Entwickler
* Vordefinierte Userstories wurden vorgestellt
* Einteilung der Teams, die die Stories kurz diskutieren, ausarbeiten und schätzen
* nach 1h Bearbeitungszeit wurden die Ergebnisse in großer Runde diskutiert




# Day 4
Datum 11.01.2016
## Travis Integration
* Einrichtung von Continuous Integration mit Travis unter (https://travis-ci.org)
  (https://travis-ci.org/martintolkiehn/todoMVC)

## Teilnahme an Vortrag über Self Motivation von Laura

## Weiterentwicklung der todoMVC
* Refactoring: Trennung von Tests und Implementierung für app und header
* Test und Implementierung für task component



# Day 5
Datum 12.01.2016
* after discussions with joel and jannis we restarted the project
* new branch
* setting up redux, react, mocha, chai, protracto, webpack, express

# Day 6
Datum 13.01.2016
* create project with component
* backend breakthrough
* coffee-script and jsx integration
* travis ci

# Day 7
Datum 14.01.2016
* frontend breakthrough
* heroku and integration in travis ci
* auto deploy on successful commit and push
* webservices
* couchbase init

# Day 8
Datum 15.01.2016
* introduction into [short methods](https://gist.github.com/actanoGiang/ed61aa9ef2ca3b85231a)


...(to be continued)
