# WUT-Thesis

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej.

#### Linki:
[ref:overleaf]: https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt
[ref:current-zip]: https://github.com/ArturB/WUT-Thesis/releases/tag/2.0.0
[ref:alpha-zip]: https://github.com/ArturB/WUT-Thesis/releases/tag/2.0.0
[ref:poradnik-ii]: http://www.ii.pw.edu.pl/index.php/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta/Przygotowanie-pracy-dyplomowej

[ref:main-tex]: https://github.com/ArturB/WUT-Thesis/blob/master/main.tex
[ref:cls-file]: https://github.com/ArturB/WUT-Thesis/blob/master/eiti/eiti-thesis.cls
[ref:makefile]: https://github.com/ArturB/WUT-Thesis/blob/master/Makefile

[ref:tex-dir]: https://github.com/ArturB/WUT-Thesis/tree/master/tex
[ref:pdfs-dir]: https://github.com/ArturB/WUT-Thesis/tree/master/pdfs
[ref:releases-dir]: https://github.com/ArturB/WUT-Thesis/tree/master/releases

[ref:issues]: https://github.com/ArturB/WUT-Thesis/issues
[ref:releases]: https://github.com/ArturB/WUT-Thesis/releases

[ref:texlive]: https://www.tug.org/texlive/
[ref:miktex]: https://miktex.org/

* [Overleaf][ref:overleaf]
* [Archiwum ZIP][ref:current-zip]

![](https://i.imgur.com/yeeuWpC.png)

TODO: czerwona ikona "texlive:failing" wynika z tego, że CI jest w trakcie przebudowy z Travisa na Dockera, ale szablon działa, można pobierać.

----
### Spis treści
* [Zawartość szablonu](#zawartość-szablonu)
* [Kompilacja](#kompilacja)
  * [Overleaf](#overleaf)
  * [Lokalnie](#lokalnie)
    * [Tex Studio](#tex-studio)
    * [VS Code](#vs-code)
  * [Kompilatory](#kompilatory)
* [Wsparcie dla innych języków](#wsparcie-dla-innych-języków)
* [Czcionki](#czcionki)
* [Problemy](#problemy)
* [Dla deweloperów](#dla-deweloperów)
* [Uwagi](#uwagi)

## Zawartość szablonu
Szablon został zatwierdzony przez Instytuty wydziału EiTI do oficjalnego użytku (na dzień 20.09.2019 jest to Instytut Informatyki, link do odpowiedniego komunikatu [tutaj][ref:poradnik-ii]). Oprócz wymaganej przepisami strony tytułowej, streszczeń i deklaracji o autorstwie, w dokumencie zawarte są przykładowe fragmenty kodu:
- prosta tabela z podpisem;
- duża tabela wielostronicowa, z regulowaną szerokością kolumn i zagnieżdżaniem (*multirow*);
- wzory matematyczne z numeracją lub bez, w tym równanie macierzowe;
- twierdzenia, aksjomaty i definicje;
- fragment kodu źródłowego programu;
- bibliografia w BibLaTeX zawierająca różne typy źródeł: artykuł, książka lub jej fragment, raport, specyfikacja techniczna, repozytorium kodu;
- wykaz symboli i skrótów;
- spisy: spis rysunków, tabel oraz załączników.

## Kompilacja
### Overleaf
Szablon jest dostępny na platformie webowej [Overleaf][ref:overleaf], co umożliwia korzystanie z niego bez konieczności instalacji TeXa na własnej maszynie. 

![](https://i.imgur.com/z1wV4sC.png)

Jednak wersja dla Overleafa nie zawsze jest aktualna, z uwagi na długotrwały proces aktualizacji: po wysłaniu zgłoszenia do supportu, pracownik Overleafa musi samodzielnie obejrzeć uploadowany szablon i ręcznie go zatwierdzić. Według stanu **na dzień 13.01.2020**, wersja dostępna **na Overleafie to 1.3.0**, natomiast **aktualna wersja stabilna to 2.1.0**. 

### Lokalnie
Najnowsza wersja szablonu jest zawsze dostępna w zakładce [Releases][ref:releases]. Aby skompilować szablon na własnej maszynie musisz mieć poprawnie zainstalowanego LaTeXa:
- [texlive][ref:texlive] lub [MikTeX][ref:miktex] na Windowsie;
- [texlive][ref:texlive] na Linuxie.
W innych konfiguracjach póki co nie próbowałem, w szczególności nie gwarantuję wsparcia dla systemów Apple'a. Z macOS-em radzisz więc sobie sam(a).

Szablon, oprócz biblioteki standardowej LaTeXa, wykorzystuje rzecz jasna również inne pakiety jako zależności. Na **texlive wymagane jest zainstalowanie** następujących zbiorów pakietów:

```
biber latexmk texlive-bibtex-extra texlive-fonts-extra texlive-latex-extra texlive-lang-polish tex-gyre
```

Na miktex menedżer pakietów powinien sam zainstalować odpowiednie zależności. 

Po zainstalowaniu LateXa, należy wyposażyć się jeszcze w IDE/edytor. Dostępne są w zasadzie dwa edytory dla LaTeXa, w których szablon działa tak jak powinien: TeX Studio oraz VS Code. Możliwa jest również kompilacja z linii poleceń za pomocą [Makefile][ref:makefile].

#### TeX Studio
Kompilacja szablonu na TeX Studio jest bardzo prosta: po zainstalowaniu LaTeXa, wystarczy uruchomić środowisko, a następnie przejść do: Opcje -> Konfiguruj TeX Studio -> Zbuduj i ustawić:
- Kompilator domyslny: Latexmk
- Domyślne narzędzie bibliografii: Biber
![](https://i.imgur.com/qycveue.png)

#### VS Code
Aby VS Code poradził sobie z kompilacją LaTeXa, należy zainstalować dla niego wtyczkę [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop). Proces kompilacji kodu do pliku PDF uruchamiany jest automatycznie po każdym zapisie. 
![](https://i.imgur.com/0j5VVCl.png)
Niestety, w VS Code są pewne problemy z wtyczką do podglądu PDF w czasie rzeczywistym: często po skompilowaniu szablonu obraz się nie odświeża i należy ręcznie zamknąć kartę i otworzyć ją ponownie. 

#### Makefile
Można również skompilować szablon z linii poleceń za pomocą Makefile:

```
make pdf
```

albo

```
make lua
```

dla kompilacji z użyciem LuaTeX. Na Windowsie *make* jest dostępny w msys, instalujesz go najlepiej za pomocą [git-scm](https://git-scm.com/).

### Kompilatory
Możliwa jest kompilacja z użyciem trzech głównych kompilatorów: [pdfTeX](https://www.tug.org/applications/pdftex/), [LuaTeX](http://www.luatex.org/) oraz [XeTeX](http://xetex.sourceforge.net/). Pewne funkcje dostępne są jednak tylko w niektórych kompilatorach:
* kompilacja na **pdfTeX** oraz **LuaTeX** daje *prawie* takie same rezultaty, co - dzięki zastosowaniu techniki [microtypingu](https://ctan.org/pkg/microtype) i [innych takich bajerów](https://en.wikipedia.org/wiki/Kerning) - gwarantuje epicki wygląd całego dokumentu.
* Na **LuaTeX** dodatkowo działa funkcja automatycznego przenoszenia jednoliterowych wyrazów do nowej linii, zgodnie z tradycyjnym zaleceniem polskiej typografii. Funkcja ta nie działa na pdfTeX, ze względu na brak możliwości oskryptowania dokumentu w języku Lua. Kompilacja LuaTeX-em jest jednak również znacznie dłuższa niż w pdfTeX.
* kompilator **XeTeX** daje możliwość stosowania własnych czcionek, czego nie zapewnia pdfTeX. Niestety, na XeTeX-u niedostępna jest część niskopoziomowych funkcji TeX-a, przez co, jeśli chodzi o końcowy rezultat, jestem w stanie zagwarantować co najwyżej [dramat](https://i.imgur.com/8yEWodB.jpg). Dlatego, jeżeli masz potrzebę zastosowania innego kompilatora niż pdfTeX (do czego nie zachęcam, bo nie ma po co) - to ogranicz się raczej do LuaTeX-a.

Zalecam zatem następujący workflow:
1. Bieżąca kompilacja podczas tworzenia dokumentu w pdfTeX;
2. Kompilacja końcowej wersji za pomocą LuaTeX-a.

Powyższe zalecenia dotyczą obu sposobów korzystania z szablonu: w przeglądarce (Overleaf) oraz lokalnie.

Szablon kompiluje się również bez problemu za pomocą dedykowanych dla LaTeXa IDE: [TeX Studio](https://www.texstudio.org/) oraz w [VS Code](https://code.visualstudio.com/), wyposażonym w [odpowiednią wtyczkę](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop).

Szablonu można używać zasadniczo w trzech głównych konfiguracjach:
* na Windowsie w [texlive][ref:texlive] oraz [miktex][ref:miktex]
* na Linuxie w [texlive][ref:texlive].



## Wsparcie dla innych języków
Szablon można stosować zarówno w języku polskim jak i angielskim, jednak **aby skorzystać z wersji w języku angielskim, należy pobrać wersję [2.0.0 Alpha][ref:alpha-zip]**. Wersja dostępna na stronie z Poradnikiem Dyplomanta Instytutu Informatyki, jak również ta na Overleafie, jest jeszcze tylko po polsku (stan na dzień 22.12.2019).

W celu wyboru języka, w pliku [main.tex][ref:main-tex] stosujemy komendę:

```
\langpol
```

dla prac w języku polskim, lub

```
\langeng
```

dla prac w języku angielskim. Wg. stanu na dzień 22.12.2019, tłumaczenie powinno być kompletne i stabilne, chociaż mogą zajść jeszcze pewne zmiany wraz ze zgłaszaniem uwag przez Instytuty.

## Czcionki
Domyślną czcionką jest [Adobe Utopia](https://ctan.org/pkg/fourier), która jest zgodna z wymaganiami wydziału i zapewnia wszystkie niezbędne interfejsy. Możliwe jest użycie innych czcionek, jednak ja nie widzę takiego powodu.

## Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y][ref:issues] na GitHubie. Pisz tam, jeżeli masz jakiś problem.

## Dla deweloperów
#### Plik klasy (.CLS)
Wygląd dokumentów tworzonych z użyciem szablonu zdefiniowany jest w pliku klasy [eiti-thesis.cls][ref:cls-file]. Pliki zawierające treść właściwego dokumentu (*.tex*) formatowane są zgodnie z plikiem klasy. Zawartość pliku .cls traktowana jest jako publiczne API niniejszego szablonu (w rozumieniu inżynierii oprogramowania) i podlega wersjonowaniu zgodnie z [odpowiednimi zaleceniami](#wersjonowanie).

#### Makefile
Budowanie szablonu odbywa się z linii komend za pomocą *Makefile*. Dostępne są następujące komendy:

```
make pdf, make lua, make xetex
```

Tworzy PDF-a z użyciem kompilatorów, odpowiednio: pdfTeX, LuaTex oraz XeTeX. Wygenerowany plik PDF jest umieszczany w katalogu [pdfs][ref:pdfs-dir], wraz z nazwą kompilatora.

```
make all
```

Tworzy wszystkie 3 wymienione wyżej PDF-y i umieszcza je w folderze [pdfs][ref:pdfs-dir].

```
make clean
```

Czyści katalog z plików pośrednich kompilacji (katalog *build*, wyłączony z kontroli wersji); usuwa również pliki pośrednie istniejące w katalogu głównym oraz PDF-y, istniejące zarówno w katalogu głównym jak i w folderze [pdfs][ref:pdfs-dir].

```
make release version=X.Y.Z
```

Tworzy (w folderze [releases][ref:releases-dir]) archiwum ZIP zawierające wersję szablonu gotową do kompilacji na lokalnej maszynie. Wytyczne dot. numerów wersji zostały opisane w rozdziale [Wersjonowanie](#wersjonowanie).

#### Branch protection, CI, Quality Assurance
Branch *master* ma status *protected*: każdy nowy kod musi być najpierw zacommitowany do osobnego brancha, a następnie przejść przez wszystkie testy (Continuous Integration) i zostać zatwierdzony przez administratora (tzn. przeze mnie) przed jego zmerge'owaniem do głównego brancha.

Testy automatycznie z użyciem [Travisa](https://travis-ci.org/ArturB/WUT-Thesis). Po każdym commicie, tworzony jest osobny build dla trzech kompilatorów: pdfTeX, LuaTeX i XeTeX. Build jest traktowany jako zaliczony, jeżeli szablon zbuduje się poprawnie na każdym z trzech kompilatorów. Buildy odbywają się w środowisku texlive na Ubuntu 18.04; próbowaliśmy dodać również automatyczne testy na Windowsie w miktex, ale ze względu na problemy z rzeczonym, automatyczne testy odbywają się jedynie na Ubuntu w texlive.

#### Wersjonowanie
Każda kolejna wersja szablonu musi być oznaczona numerem wersji w formacie *Major.Minor.Patch*. Schemat wersjonowania jest zgodny z (nieco uproszczonymi) zasadami [Semantic Versioning](https://semver.org/):
* Wersja *Major* ulega zmianie po wprowadzeniu zmian łamiących wsteczną kompatybilność (*backward incompatible changes*), tj. zmian, które:
   * uniemożliwiają kompilację kodu z użyciem pliku klasy z poprzedniej wersji;
   * znacząco zmieniają wygląd dokumentu (co może wymagać ponownych rozmów z Instytutami);
* Wersja *Minor* ulega zmianie przy wprowadzaniu nowych funkcji LaTeX-a, np. nowego znacznika, które nie powodują złamania wstecznej kompatybilności;
* Wersja *Patch* ulega zmianie przy innych niż zmiana kodu LaTeXa (np. komentarze, dokumentacja).

## Uwagi
Copyright by Artur M. Brodzki 2019, based on https://github.com/pwozniak/EiTI-Szablon by [Piotr Woźniak](https://github.com/pwozniak).
