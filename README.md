# WUT-Thesis ![CI](https://github.com/ArturB/WUT-Thesis/workflows/CI/badge.svg)

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej oraz magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej.

#### Linki:
[ref:overleaf]: https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt
[ref:current-zip]: https://github.com/ArturB/WUT-Thesis/archive/refs/heads/master.zip
[ref:poradnik-ii]: http://www.ii.pw.edu.pl/index.php/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta/Przygotowanie-pracy-dyplomowej
[ref:wiki]: https://github.com/ArturB/WUT-Thesis/wiki
[ref:zarządzenie-rektora]: https://www.bip.pw.edu.pl/Wewnetrzne-akty-prawne/Dokumenty-Rektora-PW/Zarzadzenia-Rektora/2016/Zarzadzenie-Rektora-nr-43-2016-z-dnia-8-09-2016

[ref:texlive]: https://www.tug.org/texlive/
[ref:miktex]: https://miktex.org/
[ref:vscode]: https://code.visualstudio.com/
[ref:workshop]: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop
[ref:scons]: https://scons.org/

[ref:main-tex]: https://github.com/ArturB/WUT-Thesis/blob/master/main.tex
[ref:issues]: https://github.com/ArturB/WUT-Thesis/issues

*  [>> Overleaf <<][ref:overleaf] 
* [Archiwum ZIP][ref:current-zip]
* [Wskazówki dot. kompilacji][ref:wiki]

![](https://i.imgur.com/yeeuWpC.png)

----
### Spis treści
* [Status szablonu](#status-szablonu)
* [Kompilacja](#kompilacja)
* [Wsparcie dla prac w jęz. angielskim](#wsparcie-dla-prac-w-języku-angielskim)
* [Problemy](#problemy)
* [Dla deweloperów](#dla-deweloperów)
* [Uwagi](#uwagi)

### Status szablonu
Szablon został zatwierdzony przez [niektóre Instytuty][ref:poradnik-ii] wydziału EiTI do oficjalnego użytku. W trakcie realizacji są ustalenia z pozostałymi instytutami oraz podniesienie szablonu do rangi ogólnowydziałowego.

Szablon zawiera wszystkie wymagane przepisami elementy: stronę tytułową, streszczenia, deklarację o autorstwie. Formatowanie jest zgodne z odpowiednim [Zarządzeniem Rektora][ref:zarządzenie-rektora] (43/2017, 57/2017, 109/2021; w linku to pierwsze). W dokumencie zawarte są przykładowe fragmenty kodu:
- bibliografia, zawierająca różne typy źródeł: artykuł, książka lub jej fragment, raport, specyfikacja techniczna, repozytorium kodu;
- fragment kodu źródłowego programu;
- wykaz symboli i skrótów, spis rysunków, tabel oraz załączników;

i wiele innych. 

### Kompilacja
Szablon jest dostępny na platformie webowej [Overleaf][ref:overleaf], co umożliwia korzystanie z niego bez konieczności instalacji TeXa na własnej maszynie. Jest to **najprostsza i rekomendowana** metoda korzystania z szablonu. 

~~Czasami~~ Zazwyczaj ~~może się zdarzyć~~ jest tak, że wersja dostępna na Overleafie jest ~~nieco~~ sporo starsza niż ta znajdująca się na GitHubie. Wynika to z procesu aktualizacji tj. ręcznego zatwierdzania każdej zmiany przez administratorów Overleafa. Jeżeli chcesz korzystać z najnowszej wersji szablonu, możesz ją pobrać [tutaj][ref:current-zip]. Aby skompilować szablon na własnej maszynie należy zainstalować sobie LaTeXa:
- [texlive][ref:texlive] lub [MikTeX][ref:miktex] na Windowsie;
- [texlive][ref:texlive] na Linuxie.

Po zainstalowaniu LateXa, należy wyposażyć się jeszcze w IDE/edytor. Szablon jest rozwijany z użyciem [VS Code][ref:vscode], wyposażonym we wtyczkę [LaTeX Workshop][ref:workshop]. Możliwa jest również kompilacja z linii poleceń za pomocą [SCons][ref:scons] (wymagany Python). Makefile już nie jest używany.

Aby zbudować plik PDF z pracą dyplomową, wystarczy z linii poleceń w głównym folderze projektu wykonać:
```
scons all
```

Szczegółowe informacje nt. samodzielnej kompilacji szablonu i rozwiązania ew. problemów znajdują w [encyklopedii projektu][ref:wiki]. 

### Wsparcie dla prac w języku angielskim
Szablon można stosować zarówno w języku polskim jak i angielskim. W celu wyboru języka, w pliku [main.tex][ref:main-tex] stosujemy komendę:

```
\langpol
```

dla prac w języku polskim, lub

```
\langeng
```

dla prac w języku angielskim. 

### Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y][ref:issues] na GitHubie. Pisz tam, jeżeli masz jakiś problem.

### Dla deweloperów
Informacje dla osób zainteresowanych rozwijaniem szablonu znajdują się w [encyklopedii projektu][ref:wiki]. 

### Uwagi
Copyleft © [Artur M. Brodzki](https://github.com/ArturB) 2019-2022. Loosely based on [EiTI-Szablon](https://github.com/pwozniak/EiTI-Szablon) by [Piotr Woźniak](https://github.com/pwozniak). All wrongs reserved. 
