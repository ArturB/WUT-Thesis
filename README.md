# WUT-Thesis ![Travis (.org) branch](https://img.shields.io/travis/ArturB/WUT-Thesis/master?label=texlive)

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej. 

![](https://i.imgur.com/yeeuWpC.png)

## Spis treści
* [Zawartość](#zawartość)
* [Kompilacja](#kompilacja)
  * [Overleaf](#overleaf)
  * [Lokalnie](#lokalnie)
* [Czcionki](#czcionki)
* [Problemy](#problemy)
* [Dla deweloperów](#dla-deweloperów)
* [Uwagi](#uwagi)

## Zawartość
Szablon został zatwierdzony przez Instytuty wydziału EiTI do oficjalnego użytku (na dzień 20.09.2019 jest to Instytut Informatyki, link do odpowiedniego komunikatu [tutaj](http://www.ii.pw.edu.pl/index.php/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta/Przygotowanie-pracy-dyplomowej)). Oprócz wymaganej przepisami strony tytułowej, streszczeń i deklaracji o autorstwie, w dokumencie zawarte są przykładowe fragmenty kodu:
- prosta tabela z podpisem;
- duża tabela wielostronicowa, z regulowaną szerokością kolumn i zagnieżdżaniem (multirow);
- wzory matematyczne z numeracją lub bez, w tym równanie macierzowe;
- twierdzenia, aksjomaty i definicje;
- fragment kodu źródłowego programu;
- bibliografia w BibLaTeX zawierająca różne typy źródeł (artykuł, książka lub jej fragment, raport, specyfikacja techniczna, repozytorium kodu);
- wykaz symboli i skrótów;
- spisy: rysunków, tabel oraz załączników.

## Kompilacja
Możliwa jest kompilacja z użyciem trzech głównych kompilatorów: [pdfTeX](https://www.tug.org/applications/pdftex/), [LuaTeX](http://www.luatex.org/) oraz [XeTeX](http://xetex.sourceforge.net/). Pewne funkcje dostępne są jednak tylko w niektórych kompilatorach:
* kompilacja na **pdfTeX** oraz **LuaTeX** daje *niemal* takie same rezultaty, co - dzięki zastosowaniu techniki microtypingu i innych takich bajerów - gwarantuje epicki wygląd całego dokumentu. 
* Na **LuaTeX** dodatkowo działa funkcja przenoszenia jednoliterowych wyrazów do nowej linii, zgodnie z tradycyjnym zaleceniem polskiej typografii. Funkcja ta nie działa na pdfTeX, ze względu na brak możliwości oskryptowania dokumentu w języku Lua. Kompilacja LuaTeX-em jest jednak również znacznie dłuższa niż w pdfTeX. 
* kompilator **XeTeX** daje możliwość stosowania własnych czcionek, czego nie zapewnia pdfTeX. Niestety, na XeTeX-u niedostępna jest część niskopoziomowych funkcji TeX-a, przez co, jeśli chodzi o końcowy rezultat, jestem w stanie zagwarantować co najwyżej dramat. Dlatego, jeżeli masz potrzebę zastosowania innego kompilatora niż pdfTeX (do czego nie zachęcam, bo nie ma po co) - to ogranicz się raczej do LuaTeX-a. 

Zalecam zatem następujący workflow:
1. Bieżąca kompilacja podczas tworzenia dokumentu w pdfTeX;
2. Kompilacja końcowej wersji za pomocą LuaTeX-a. 

Powyższe zalecenia dotyczą obu sposobów korzystania z szablonu: w przeglądarce (Overleaf) oraz lokalnie. 

### Overleaf
Jest to chyba najpopularniejsze w chwili obecnej środowisko TeX-owe, które pozwala na tworzenie i edycję dokumentów w przeglądarce, bez konieczności instalowania TeX-a na lokalnej maszynie.

![](https://i.imgur.com/WfjM51M.png)

Link do szablonu: https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt. 

Na jego podstawie możecie tworzyć i edytować własne dokumenty. 

### Lokalnie
Jeżeli nie lubisz Overleafa, możliwa jest również samodzielna kompilacja szablonu. Kolejne wersje szablonu gotowe do kompilacji znajdują się w zakładce [Releases](https://github.com/ArturB/WUT-Thesis/releases). Najnowsza wersja szablonu gotowa jest zawsze dostępna pod adresem https://github.com/ArturB/WUT-Thesis/releases/download/latest/WUT-Thesis.zip. Kompilacja z użyciem Makefile:

> make pdf

albo

> make lua

dla kompilacji z użyciem LuaTeX. 

Szablon kompiluje się również bez problemu za pomocą dedykowanych dla LaTeXa IDE: [TeX Studio](https://www.texstudio.org/) oraz w [VS Code](https://code.visualstudio.com/), wyposażonym w [odpowiednią wtyczkę](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop). 

Szablonu można używać zasadniczo w trzech głównych konfiguracjach:
* na Windowsie w [texlive](https://www.tug.org/texlive/) oraz [miktex](https://miktex.org/);
* na Linuxie w [texlive](https://www.tug.org/texlive/).

Oficjalne Quality Assurance gwarantujemy tylko dla **środowiska texlive**; miktex ma długą tradycję [problemów z uprawnieniami](https://github.com/MiKTeX/miktex/issues/83), dlatego w tym środowisku nie przeprowadzamy automatycznych testów. Co prawda w większości sytuacji szablon *powinien* również działać w miktex, niemniej gorąco zachęcam do instalowania texlive-a również na swoich Windowsach. 

W innych konfiguracjach póki co nie próbowałem, w szczególności nie gwarantuję wsparcia dla systemów Apple'a. z mcOS-em radzisz więc sobie sam(a). 

Szablon jest zoptymalizowany pod użycie z systemem kontroli wersji git oraz pracę z wykorzystaniem . Możliwa - i zalecana przy większych dokumentach - jest praca w systemie wieloplikowym: po jednym pliku na każdy rozdział. Pliki z rozdziałami zawartymi w szablonie znajdują się w katalogu [tex](https://github.com/ArturB/WUT-Thesis/tree/master/tex). 

## Czcionki
Domyślną czcionką jest [Adobe Utopia](https://ctan.org/pkg/fourier), która jest zgodna z wymaganiami wydziału i zapewnia wszystkie niezbędne interfejsy. Możliwe jest użycie innych czcionek, jednak ja nie widzę takiego powodu. 
 
## Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y](https://github.com/ArturB/WUT-Thesis/issues) na GitHubie. Pisz tam, jeżeli masz jakiś problem. 

## Dla deweloperów


## Uwagi
Copyright by Artur M. Brodzki 2019, based on https://github.com/pwozniak/EiTI-Szablon by [Piotr Woźniak](https://github.com/pwozniak). 
