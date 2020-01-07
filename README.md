# WUT-Thesis 

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej. 

#### Linki:
* [Overleaf](https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt)
* [Archiwum ZIP](https://github.com/ArturB/WUT-Thesis/releases/tag/2.0.0)

![](https://i.imgur.com/yeeuWpC.png)

TODO: czerwona ikona "texlive:failing" wynika z tego, że CI jest w trakcie przebudowy z Travisa na Dockera, ale szablon działa, można pobierać. 

----
### Spis treści
* [Zawartość szablonu](#zawartość-szablonu)
* [Kompilacja](#kompilacja)
  * [Overleaf](#overleaf)
  * [Lokalnie](#lokalnie)
* [Prace w języku angielskim](#prace-w-języku-angielskim)
* [Czcionki](#czcionki)
* [Problemy](#problemy)
* [Dla deweloperów](#dla-deweloperów)
* [Uwagi](#uwagi)

## Zawartość szablonu
Szablon został zatwierdzony przez Instytuty wydziału EiTI do oficjalnego użytku (na dzień 20.09.2019 jest to Instytut Informatyki, link do odpowiedniego komunikatu [tutaj](http://www.ii.pw.edu.pl/index.php/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta/Przygotowanie-pracy-dyplomowej)). Oprócz wymaganej przepisami strony tytułowej, streszczeń i deklaracji o autorstwie, w dokumencie zawarte są przykładowe fragmenty kodu:
- prosta tabela z podpisem;
- duża tabela wielostronicowa, z regulowaną szerokością kolumn i zagnieżdżaniem (*multirow*);
- wzory matematyczne z numeracją lub bez, w tym równanie macierzowe;
- twierdzenia, aksjomaty i definicje;
- fragment kodu źródłowego programu;
- bibliografia w BibLaTeX zawierająca różne typy źródeł: artykuł, książka lub jej fragment, raport, specyfikacja techniczna, repozytorium kodu;
- wykaz symboli i skrótów;
- spisy: spis rysunków, tabel oraz załączników.

## Kompilacja
Możliwa jest kompilacja z użyciem trzech głównych kompilatorów: [pdfTeX](https://www.tug.org/applications/pdftex/), [LuaTeX](http://www.luatex.org/) oraz [XeTeX](http://xetex.sourceforge.net/). Pewne funkcje dostępne są jednak tylko w niektórych kompilatorach:
* kompilacja na **pdfTeX** oraz **LuaTeX** daje *prawie* takie same rezultaty, co - dzięki zastosowaniu techniki [microtypingu](https://ctan.org/pkg/microtype) i [innych takich bajerów](https://en.wikipedia.org/wiki/Kerning) - gwarantuje epicki wygląd całego dokumentu. 
* Na **LuaTeX** dodatkowo działa funkcja automatycznego przenoszenia jednoliterowych wyrazów do nowej linii, zgodnie z tradycyjnym zaleceniem polskiej typografii. Funkcja ta nie działa na pdfTeX, ze względu na brak możliwości oskryptowania dokumentu w języku Lua. Kompilacja LuaTeX-em jest jednak również znacznie dłuższa niż w pdfTeX. 
* kompilator **XeTeX** daje możliwość stosowania własnych czcionek, czego nie zapewnia pdfTeX. Niestety, na XeTeX-u niedostępna jest część niskopoziomowych funkcji TeX-a, przez co, jeśli chodzi o końcowy rezultat, jestem w stanie zagwarantować co najwyżej [dramat](https://i.imgur.com/8yEWodB.jpg). Dlatego, jeżeli masz potrzebę zastosowania innego kompilatora niż pdfTeX (do czego nie zachęcam, bo nie ma po co) - to ogranicz się raczej do LuaTeX-a. 

Zalecam zatem następujący workflow:
1. Bieżąca kompilacja podczas tworzenia dokumentu w pdfTeX;
2. Kompilacja końcowej wersji za pomocą LuaTeX-a. 

Powyższe zalecenia dotyczą obu sposobów korzystania z szablonu: w przeglądarce (Overleaf) oraz lokalnie. 

### Overleaf
Jest to chyba najpopularniejsze w chwili obecnej środowisko TeX-owe, które pozwala na tworzenie i edycję dokumentów w przeglądarce, bez konieczności instalowania TeX-a na lokalnej maszynie.

![](https://i.imgur.com/z1wV4sC.png)

Link do szablonu: https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt. 

Na jego podstawie możecie tworzyć i edytować własne dokumenty. 

### Lokalnie
Jeżeli nie lubisz Overleafa, możliwa jest również samodzielna kompilacja szablonu. Kolejne wersje szablonu gotowe do kompilacji znajdują się w zakładce [Releases](https://github.com/ArturB/WUT-Thesis/releases). Najnowsza wersja szablonu jest zawsze dostępna pod adresem https://github.com/ArturB/WUT-Thesis/releases/tag/2.0.0. Kompilacja za pomocą Makefile:

```
make pdf
```

albo

```
make lua
```

dla kompilacji z użyciem LuaTeX. Na Windowsie *make* jest dostępny w msys, instalujesz go najlepiej razem z [git-scm](https://git-scm.com/). 

Szablon kompiluje się również bez problemu za pomocą dedykowanych dla LaTeXa IDE: [TeX Studio](https://www.texstudio.org/) oraz w [VS Code](https://code.visualstudio.com/), wyposażonym w [odpowiednią wtyczkę](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop). 

Szablonu można używać zasadniczo w trzech głównych konfiguracjach:
* na Windowsie w [texlive](https://www.tug.org/texlive/) oraz [miktex](https://miktex.org/);
* na Linuxie w [texlive](https://www.tug.org/texlive/).

Szablon, oprócz biblioteki standardowej LaTeXa, wykorzystuje rzecz jasna również inne pakiety jako zależności.

**Uwaga**: Na texlive wymagane jest zainstalowanie następujących zbiorów pakietów

```
biber latexmk texlive-bibtex-extra texlive-fonts-extra texlive-latex-extra texlive-lang-polish tex-gyre
```

Na miktex menedżer pakietów powinien sam zainstalować odpowiednie zależności.  

Oficjalne Quality Assurance gwarantujemy tylko dla **środowiska texlive**; miktex ma długą tradycję [problemów z uprawnieniami](https://github.com/MiKTeX/miktex/issues/83), dlatego w tym środowisku nie przeprowadzamy automatycznych testów. Co prawda w większości sytuacji szablon *powinien* działać również w miktex, niemniej zachęcam do instalowania texlive-a także na swoich Windowsach. W innych konfiguracjach póki co nie próbowałem, w szczególności nie gwarantuję wsparcia dla systemów Apple'a. Z macOS-em radzisz więc sobie sam(a). 

Szablon jest zoptymalizowany pod użycie z systemem kontroli wersji git. Możliwa - i zalecana przy większych dokumentach - jest praca w systemie wieloplikowym: po jednym pliku na każdy rozdział. Pliki z rozdziałami zawartymi w szablonie znajdują się w katalogu [tex](https://github.com/ArturB/WUT-Thesis/tree/master/tex). 

## Język pracy

W celu wyboru języka, w pliku [main.tex](https://github.com/ArturB/WUT-Thesis/blob/master/main.tex) stosujemy:

- 🇵🇱 `\langpol`
- 🇬🇧 `\langeng`

**Uwaga**:

Szablon można stosować zarówno w języku polskim jak i angielskim, jednak **aby skorzystać z wersji w języku angielskim, należy pobrać wersję 2.0.0 Alpha:** https://github.com/ArturB/WUT-Thesis/releases/tag/2.0.0. Wersja dostępna na stronie z Poradnikiem Dyplomanta Instytutu Informatyki, jak również ta na Overleafie, jest jeszcze tylko po polsku (stan na dzień 22.12.2019). Wg. stanu na dzień 22.12.2019, tłumaczenie powinno być kompletne i stabilne, chociaż mogą zajść jeszcze pewne zmiany wraz ze zgłaszaniem uwag przez Instytuty.

## Czcionki
Domyślną czcionką jest [Adobe Utopia](https://ctan.org/pkg/fourier), która jest zgodna z wymaganiami wydziału i zapewnia wszystkie niezbędne interfejsy. Możliwe jest użycie innych czcionek, jednak ja nie widzę takiego powodu. 

## Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y](https://github.com/ArturB/WUT-Thesis/issues) na GitHubie. Pisz tam, jeżeli masz jakiś problem. 

## Dla deweloperów
### Plik klasy (.CLS)
Wygląd dokumentów tworzonych z użyciem szablonu zdefiniowany jest w pliku klasy [eiti-thesis.cls](https://github.com/ArturB/WUT-Thesis/blob/master/eiti/eiti-thesis.cls). Pliki zawierające treść właściwego dokumentu (*.tex*) formatowane są zgodnie z plikiem klasy. Zawartość pliku .cls traktowana jest jako publiczne API niniejszego szablonu (w rozumieniu inżynierii oprogramowania) i podlega wersjonowaniu zgodnie z [odpowiednimi zaleceniami](#wersjonowanie). 

### Szczegóły kompilacji
Budowanie szablonu odbywa się z linii komend za pomocą *Makefile*. Dostępne są następujące komendy:

```
make pdf
make lua
make xetex
```

Tworzy PDF-a z użyciem kompilatorów, odpowiednio: pdfTeX, LuaTex oraz XeTeX. Wygenerowany plik PDF jest umieszczany w katalogu [pdfs](https://github.com/ArturB/WUT-Thesis/tree/master/pdfs), wraz z nazwą kompilatora. Aby utworzyć wszystkie 3 wymienione wyżej PDF-y w folderze [pdfs](https://github.com/ArturB/WUT-Thesis/tree/master/pdfs), należy użyć:

```
make all
```

### Czyszczenie projektu

```
make clean
```

Czyści katalog z plików pośrednich kompilacji (katalog *build*, wyłączony z kontroli wersji); usuwa również pliki pośrednie istniejące w katalogu głównym oraz PDF-y, istniejące zarówno w katalogu głównym jak i w folderze [pdfs](https://github.com/ArturB/WUT-Thesis/tree/master/pdfs).

### Wersjonowanie

```
make release version=X.Y.Z
```

Tworzy (w folderze [releases](https://github.com/ArturB/WUT-Thesis/tree/master/releases)) archiwum ZIP zawierające wersję szablonu gotową do kompilacji na lokalnej maszynie.

Każda kolejna wersja szablonu musi być oznaczona numerem wersji w formacie *Major.Minor.Patch*. Schemat wersjonowania jest zgodny z (nieco uproszczonymi) zasadami [Semantic Versioning](https://semver.org/):
* Wersja *Major* ulega zmianie po wprowadzeniu zmian łamiących wsteczną kompatybilność (*backward incompatible changes*), tj. zmian, które:
   * uniemożliwiają kompilację kodu z użyciem pliku klasy z poprzedniej wersji;
   * znacząco zmieniają wygląd dokumentu (co może wymagać ponownych rozmów z Instytutami);
* Wersja *Minor* ulega zmianie przy wprowadzaniu nowych funkcji LaTeX-a, np. nowego znacznika, które nie powodują złamania wstecznej kompatybilności;
* Wersja *Patch* ulega zmianie przy innych niż zmiana kodu LaTeXa (np. komentarze, dokumentacja).

### Branch protection, CI, Quality Assurance

Branch *master* ma status *protected*: każdy nowy kod musi być najpierw zacommitowany do osobnego brancha, a następnie przejść przez wszystkie testy (Continuous Integration) i zostać zatwierdzony przez administratora (tzn. przeze mnie) przed jego zmerge'owaniem do głównego brancha.

Testy automatycznie z użyciem [Travisa](https://travis-ci.org/ArturB/WUT-Thesis). Po każdym commicie, tworzony jest osobny build dla trzech kompilatorów: pdfTeX, LuaTeX i XeTeX. Build jest traktowany jako zaliczony, jeżeli szablon zbuduje się poprawnie na każdym z trzech kompilatorów. Buildy odbywają się w środowisku texlive na Ubuntu 18.04; próbowaliśmy dodać również automatyczne testy na Windowsie w miktex, ale ze względu na problemy z rzeczonym, automatyczne testy odbywają się jedynie na Ubuntu w texlive.

## Uwagi
Copyright by Artur M. Brodzki 2019, based on https://github.com/pwozniak/EiTI-Szablon by [Piotr Woźniak](https://github.com/pwozniak). 
