/*
Create associative array with neighborghoods of Vilnus and their population (take 10 largest ones). Print out formated output from this
array. Source for person count:
https://en.wikipedia.org/wiki/Neighborhoods_of_Vilnius
*/
DECLARE
  TYPE t_population 
  IS TABLE OF NUMBER 
  INDEX BY VARCHAR2(50);
  l_population t_population;
  t_second VARCHAR2(50);
BEGIN
  l_population('?irm?nai') := 47410;  
  l_population('Antakalnis') := 39697;  
  l_population('Fabijoni?k?s') := 36644;
  l_population('?e?kin?') := 36604;
  l_population('Naujininkai') := 33457;
  l_population('Naujoji Vilnia') := 32775;
  l_population('Lazdynai') := 32164;
  l_population('Karolini?k?s') := 31175;
  l_population('Justini?k?s') := 30958;
  l_population('Verkiai') := 30856;
  l_population('Naujamiestis') := 27892;
  
  t_second := l_population.FIRST;
  WHILE t_second IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE('Neighborhood: ' || t_second || ', Population: ' || l_population(t_second));
    t_second := l_population.NEXT(t_second);
  END LOOP;
END;

