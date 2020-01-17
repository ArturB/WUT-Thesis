# WUT-Thesis

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej.

#### Linki:
[ref:overleaf]: https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt
[ref:current-zip]: https://github.com/ArturB/WUT-Thesis/releases/tag/2.1.0
[ref:alpha-zip]: https://github.com/ArturB/WUT-Thesis/releases/tag/2.1.0
[ref:poradnik-ii]: http://www.ii.pw.edu.pl/index.php/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta/Przygotowanie-pracy-dyplomowej
[ref:wiki]: https://github.com/ArturB/WUT-Thesis/wiki

[ref:main-tex]: https://github.com/ArturB/WUT-Thesis/blob/master/main.tex
[ref:releases-dir]: https://github.com/ArturB/WUT-Thesis/tree/master/releases

[ref:issues]: https://github.com/ArturB/WUT-Thesis/issues
[ref:releases]: https://github.com/ArturB/WUT-Thesis/releases

[ref:texlive]: https://www.tug.org/texlive/
[ref:miktex]: https://miktex.org/
[ref:texstudio]: https://www.texstudio.org/
[ref:vscode]: https://code.visualstudio.com/

* [Overleaf][ref:overleaf] **[recommended]**
* [Archiwum ZIP][ref:releases]
* [Wskazówki dot. kompilacji (wiki)][ref:wiki]

![](https://i.imgur.com/yeeuWpC.png)

----
### Spis treści
* [Status szablonu](#status-szablonu)
* [Kompilacja](#kompilacja)
* [Wsparcie dla prac w jęz. angielskim](#wsparcie-dla-prac-w-języku-angielskim)
* [Problemy](#problemy)
* [Dla deweloperów](#dla-deweloperów)
* [Uwagi](#uwagi)

## Status szablonu
Szablon został zatwierdzony przez niektóre Instytuty wydziału EiTI do oficjalnego użytku; na dzień 17.01.2020 jest to Instytut Informatyki [>>klik<<j][ref:poradnik-ii]. W trakcie realizacji są ustalenia z pozostałymi instytutami oraz podniesienie szablonu do rangi ogólnowydziałowego. Więcej informacji na ten temat znajduje się [w encyklopedii projektu][ref:wiki]. 

Szablon zawiera wszystkie wymagane przepisami elementy: stronę tytułową, streszczenia, deklarację o autorstwie. Formatowanie poszczególnych sekcji jest wynikiem ustaleń z Instytutami. W dokumencie zawarte są również przykładowe fragmenty kodu, m. in:
- fragment kodu źródłowego programu;
- bibliografia w BibLaTeX zawierająca różne typy źródeł: artykuł, książka lub jej fragment, raport, specyfikacja techniczna, repozytorium kodu;
- wykaz symboli i skrótów, spis rysunków, tabel oraz załączników;

i wiele innych. 

## Kompilacja
Szablon jest dostępny na platformie webowej [Overleaf][ref:overleaf], co umożliwia korzystanie z niego bez konieczności instalacji TeXa na własnej maszynie.Niestety wersja dla Overleafa nie zawsze jest aktualna, z uwagi na długotrwały proces aktualizacji tj. ręczne zatwierdzanie każdej zmiany przez pracowników Overleafa. 

Jeżeli chcesz korzystać z najnowszej wersji szablonu, możesz ją pobrać w zakładce [Releases][ref:releases]. Aby skompilować szablon na własnej maszynie należy zainstalować sobie LaTeXa:
- [texlive][ref:texlive] lub [MikTeX][ref:miktex] na Windowsie;
- [texlive][ref:texlive] na Linuxie.

Po zainstalowaniu LateXa, należy wyposażyć się jeszcze w IDE/edytor. Dostępne są dwa edytory: [TeX Studio][ref:texstudio] oraz [VS Code][ref:vscode]. Możliwa jest również kompilacja z linii poleceń za pomocą [Makefile][ref:makefile].

Szczegółowe informacje nt. samodzielnej kompilacji szablonu, w tym rozwiązania ew. problemów znajdują [w encyklopedii projektu][ref:wiki]. 

## Wsparcie dla prac w języku angielskim
Szablon od wersji 2.0.0 można stosować zarówno w języku polskim jak i angielskim. W celu wyboru języka, w pliku [main.tex][ref:main-tex] stosujemy komendę:

```
\langpol
```

dla prac w języku polskim, lub

```
\langeng
```

dla prac w języku angielskim. Wg. stanu na dzień 13.01.2020, tłumaczenie powinno być kompletne i stabilne, chociaż mogą zajść jeszcze pewne zmiany wraz ze zgłaszaniem uwag przez Instytuty.

## Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y][ref:issues] na GitHubie. Pisz tam, jeżeli masz jakiś problem.

## Dla deweloperów
Informacje dla osób zainteresowanych rozwijaniem szablonu znajdują się w [encyklopedii projektu][ref:wiki]. 

## Uwagi
Copyleft © [Artur M. Brodzki](https://github.com/ArturB) 2019-2020. Loosely based on [EiTI-Szablon](https://github.com/pwozniak/EiTI-Szablon) by [Piotr Woźniak](https://github.com/pwozniak). All wrongs reserved. 
