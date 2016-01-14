#Naming Rules

1. **intention-revealing:** avoid implicity. List<int[]> getThem -> List<Cell> getFlaggedCells().

2. **avoid disinformation:** avoid keywords, 1,0,O,l.

3. **make meaningful distinctions:** avoid e.g. var info vs var data, avoid redundant names (noise words) 'variable' 
should never appear in variable name. 
money <> moneyAmount, customerInfo <> customer, theMessage <> message

4. **use pronounceable names:** easier to explain to new developers. class DtaRcrd102 -> class Customer.

5. **use searchable names:** single-letter names only in short methods -> length of a name should correspond to the size of its scope.
DAYS_PER_WEEK > seven/7.

6. **Avoid Encoding.**

6.1 **Avoid Hungarian Notation:** {Präfix} {Datentyp} {Bezeichner},  idBezeichner -> i = index, d = double, Bezeichner = Bezeichner.

6.2. **Avoid Member Prefixes.**

6.3. **Interfaces & Implementations:** IShapeFactory -> ShapeFactory -> CShapeFactory/ShapeFactoryImpl.

7. **Avoid Mental Mapping.**

8. **Class Names:** nouns/ noun phrase, e.g. Customer, WikiPage. Never use: Manager, Processor, Data, Info.

9. **Method Names:** verb/ verb phrases e.g. like, save, deletePage; Accesors, Mutators, predicates -> get, set, is.

10. **Don't be cute:** whack() -> kill(), avoid slangs -> Say what you mean. Mean what you say.

11. **Pick one Word per Concept:** e.g. confusing fetch, retrieve, get same methods of different classes.

12. **Don't pun:** e.g. many classes with add method, which are semantically the same. 
Make a new class with method with not same concept -> name it e.g. "append".

13. **Use Solution Domain Names:** use computer science terms. AccountVisitor -> Visitor Pattern.

14. **Use Problem Domain Names:** clue for reader to ask domain expert.

15. **Add Meaningful Context.**

16. **Don't Add Gratuitous Context:** "Gas Station Deluxe"application -> dont add "GSD" to every class.
