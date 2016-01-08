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

# Schritte im Kata
* Test und Erstellung eines Stores
* Test der Implementierung der Übergabe von Actions an den Store mit dispatch
* Refactoring der Package Struktur zur besseren Gliederung der Module
* Durchstich zu React
* Test der Implementierung eines Header-Elements mit React

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

...(to be continued)
