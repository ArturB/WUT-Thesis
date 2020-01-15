# WUT-Thesis

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej.

#### Linki:
[ref:overleaf]: https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt
[ref:current-zip]: https://github.com/ArturB/WUT-Thesis/releases/tag/2.1.0
[ref:alpha-zip]: https://github.com/ArturB/WUT-Thesis/releases/tag/2.1.0
[ref:poradnik-ii]: http://www.ii.pw.edu.pl/index.php/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta/Przygotowanie-pracy-dyplomowej
[ref:wiki]: https://github.com/ArturB/WUT-Thesis/wiki
[ref:wiki-kompilacja]: https://github.com/ArturB/WUT-Thesis/wiki/Kompilacja-szablonu
[ref:wiki-dla-deweloperów]: https://github.com/ArturB/WUT-Thesis/wiki/Dla-deweloper%C3%B3w

[ref:main-tex]: https://github.com/ArturB/WUT-Thesis/blob/master/main.tex
[ref:releases-dir]: https://github.com/ArturB/WUT-Thesis/tree/master/releases

[ref:issues]: https://github.com/ArturB/WUT-Thesis/issues
[ref:releases]: https://github.com/ArturB/WUT-Thesis/releases

[ref:texlive]: https://www.tug.org/texlive/
[ref:miktex]: https://miktex.org/
[ref:texstudio]: https://www.texstudio.org/
[ref:vscode]: https://code.visualstudio.com/

* [Overleaf][ref:overleaf]
* [Archiwum ZIP][ref:releases]
* [Szczegółowe informacje nt. kompilacji szablonu (wiki)][ref:wiki]

![](https://i.imgur.com/yeeuWpC.png)

----
### Spis treści
* [Zawartość szablonu](#zawartość-szablonu)
* [Kompilacja](#kompilacja)
* [Wsparcie dla prac w jęz. angielskim](#wsparcie-dla-prac-w-języku-angielskim)
* [Czcionki](#czcionki)
* [Problemy](#problemy)
* [Dla deweloperów](#dla-deweloperów)
* [Uwagi](#uwagi)

## Zawartość szablonu
Szablon został zatwierdzony przez Instytuty wydziału EiTI do oficjalnego użytku (na dzień 23.01.2020 jest to Instytut Informatyki, link do odpowiedniego komunikatu [tutaj][ref:poradnik-ii]). Oprócz wymaganej przepisami strony tytułowej, streszczeń i deklaracji o autorstwie, w dokumencie zawarte są przykładowe fragmenty kodu:
- prosta tabela z podpisem;
- duża tabela wielostronicowa, z regulowaną szerokością kolumn i zagnieżdżaniem (*multirow*);
- wzory matematyczne z numeracją lub bez, w tym równanie macierzowe;
- twierdzenia, aksjomaty i definicje;
- fragment kodu źródłowego programu;
- bibliografia w BibLaTeX zawierająca różne typy źródeł: artykuł, książka lub jej fragment, raport, specyfikacja techniczna, repozytorium kodu;
- wykaz symboli i skrótów;
- spisy: spis rysunków, tabel oraz załączników.

## Kompilacja
Szablon jest dostępny na platformie webowej [Overleaf][ref:overleaf], co umożliwia korzystanie z niego bez konieczności instalacji TeXa na własnej maszynie.Niestety wersja dla Overleafa nie zawsze jest aktualna, z uwagi na długotrwały proces aktualizacji. Jeżeli chcesz korzystać z najnowszej wersji szablonu, musisz pobrać ją z tego repozytorium. Najnowsza wersja szablonu jest zawsze dostępna w zakładce [Releases][ref:releases]. 

Aby skompilować szablon na własnej maszynie należy zainstalować sobie LaTeXa:
- [texlive][ref:texlive] lub [MikTeX][ref:miktex] na Windowsie;
- [texlive][ref:texlive] na Linuxie.

Po zainstalowaniu LateXa, należy wyposażyć się jeszcze w IDE/edytor. Dostępne są dwa porządne edytory, w których szablon działa tak jak powinien: [TeX Studio][ref:texstudio] oraz [VS Code][ref:vscode]. Możliwa jest również kompilacja z linii poleceń za pomocą Makefile.

Szczegółowe informacje nt. samodzielnej kompilacji szablonu znajdują w [encyklopedii projektu][ref:wiki-kompilacja]. 

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

## Czcionki
Domyślną czcionką jest [Adobe Utopia](https://ctan.org/pkg/fourier), która jest zgodna z wymaganiami wydziału i zapewnia wszystkie niezbędne interfejsy. Możliwe jest użycie innych czcionek, jednak ja nie widzę takiego powodu.

## Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y][ref:issues] na GitHubie. Pisz tam, jeżeli masz jakiś problem.

## Dla deweloperów
Informacje dla osób zainteresowanych rozwijaniem szablonu znajdują się w [encyklopedii projektu][ref:wiki-dla-deweloperów]. 

## Uwagi
Copyleft © [Artur M. Brodzki](https://github.com/ArturB) 2019-2020. Loosely based on [EiTI-Szablon](https://github.com/pwozniak/EiTI-Szablon) by [Piotr Woźniak](https://github.com/pwozniak). All wrongs reserved. 
