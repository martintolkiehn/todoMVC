Zusammenfassung der Einarbeitungs-Tage
======================================



# Day 0
Datum 07.11.2016

*  Aufteilung der initialen Arbeit
*  Aufsetzen eines Team-Github-Repository für Projekt TodoMVC mit allen Beteiligten als Contributor
*  Grundsätzlicher Test des gemeinsamen Repositories (jeder Entwickler clont, commited, pushed, pulled, merded einmal)

## Arbeits-Verteilung
*  Erarbeitung/Zusammenfassung der CleanCode-Namens-Grundregeln
*  Initiale Einarbeitung in React-Reduce
*  Findung Test-Framework für die TDD zu Kata-Punktes 1 (TodoMVC im Browser)
*  Github



# Day 1
Datum 07.11.2016

## Einrichtung Test-Framework im Projekt TodoMVC

*  Erklärung des Modul-Konzepts von node.js und des npm
*  Installations-Arten von benötigten Bibliotheken 
   - npm install 
   - lokal/global 
   - Speicherung Dependencies in package.json
   - automatisches Laden aller Module durch npm install aufgrund der definierten Abhängigkeiten in package.json
*  Instalation der Test-Bibliotheken und coffee-script 
   (Wahl von Coffee-Script als Sprache für die Test-Spezifikation aufgrund der Einfachheit und Klarheit)   
*  Aufsetzen von simplen Test
   Erklärung des grundsätzlichen Aufbaus des Test-Frameworks 
   Erklärung von Coffe-Script-Syntax in dem Zusammenhang

### Test-Framework
*  mocha
*  chai
*  coffe-script
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
   1 Driver, 1 Navigator, 2 Zuhörerh
## Diskussion mit Scrum-Master
*  Reflektion des Tages
*  Besprechung des groben Ziels für nächsten Tag
*  Beschluss die Erfahrungen in einem Day-Report zusammenzufassen und zur Verfügung zu stellen



# Day 2
Datum 08.01.2016
## Ablage der Dokumentation in Doc-Verzeichnis des TodoMVC-Projektes
*  Zusammenfassung von Day 0 und 1 im "Docs/Day-Report.md"
*  Ablage der CleanCode-Namens-Regeln in "Docs/???.md"

...(to be continued)