# WUT-Thesis ![Travis (.org) branch](https://img.shields.io/travis/ArturB/WUT-Thesis/master?label=texlive)

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej. 
 ![](https://i.imgur.com/bFLeJ93.png)

## Spis treści
 * [Zawartość](#zawartość)
 * [Kompilacja](#kompilacja)
   * [Overleaf](#overleaf)
   * [Lokalnie](#lokalnie)
 * [Czcionki](#czcionki)
 * [Problemy](#problemy)
 * Dla deweloperów
 * Uwagi

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
Możliwa jest kompilacja z użyciem trzech głównych kompilatorów: [pdfTeX](https://www.tug.org/applications/pdftex/), [LuaTeX](http://www.luatex.org/) oraz [XeTeX](http://xetex.sourceforge.net/). Pewne funkcje dostępne są tylko z niektórych kompilatorach:
 * kompilacja na **pdfTeX** oraz **LuaTeX** daje *niemal* takie same rezultaty, co - dzięki zastosowaniu techniki microtypingu i innych takich bajerów - gwarantuje epicki wygląd całego dokumentu. 
 * Na **LuaTeX** dodatkowo działa funkcja przenoszenia jednoliterowych wyrazów do nowej linii, zgodnie z tradycyjnym zaleceniem polskiej typografii. Funkcja ta nie działa na pdfTeX, ze względu na brak możliwości oskryptowania dokumentu w języku Lua. 
 * kompilator **XeTeX** daje możliwość stosowania własnych czcionek, czego nie zapewnia pdfTeX. Niestety, na XeTeX-u niedostępna jest część niskopoziomowych funkcji TeX-a, przez co, jeśli chodzi o końcowy rezultat, jestem w stanie zagwarantować co najwyżej dramat. Dlatego, jeżeli masz potrzebę zastosowania innego kompilatora niż pdfTeX (do czego nie zachęcam, bo nie ma po co) - to ogranicz się raczej do LuaTeX-a. 

Powyższe zalecenia dotyczą obu możliwych sposobów korzystania z szablonu: w przeglądarce (Overleaf) oraz lokalnie. 

### Overleaf
Jest to chyba najpopularniejsze w chwili obecnej środowisko TeX-owe, które pozwala na tworzenie i edycję dokumentów w przeglądarce, bez konieczności instalowania TeX-a na lokalnej maszynie.

![](https://i.imgur.com/WfjM51M.png)

Link do szablonu: [https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt](https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt)

Na jego podstawie możecie tworzyć i edytować własne dokumenty. 

### Lokalnie
Jeżeli nie lubisz Overleafa, możliwa jest również samodzielna kompilacja szablonu. Kolejne wersje szablonu gotowe do kompilacji znajdują się w zakładce [Releases](Najnowsza wersja szablonu gotowa do kompilacji jest zawsze dostępna pod adresem https://github.com/ArturB/WUT-Thesis/releases/download/latest/WUT-Thesis.zip. 

[Tutaj](https://github.com/ArturB/WUT-Thesis/blob/master/main.pdf) dostępny podgląd w formacie PDF. 
 
## Kompilacja i kompatybilność
 Kompilatory XeTeX oraz LuaTeX dają możliwość stosowania własnych czcionek, czego nie zapewnia pdfTeX. Kompilacja na pdfTeX oraz LuaTeX daje te same rezultaty, co - dzięki zastosowaniu techniki microtypingu i innych takich bajerów - gwarantuje epicki wygląd całego dokumentu. 

Szablon testowałem w następujących konfiguracjach:
 - na Windowsie w MikTeX oraz TeX Live;
 - na Linuxie w TeX Live.
 
W innych środowiskach póki co nie próbowałem, w szczególności nie gwarantuję wsparcia dla systemów Apple'a. Z MacOS-em radzisz sobie więc sam(a). 

Szablon jest zoptymalizowany pod użycie z systemem kontroli wersji git oraz pracę z wykorzystaniem [TeX Studio](https://www.texstudio.org/). Możliwa - i zalecana przy większych dokumentach - jest praca w systemie wieloplikowym: po jednym pliku na każdy rozdział. Pliki z rozdziałami zawartymi w szablonie znajdują się w katalogu [tex](https://github.com/ArturB/WUT-Thesis/tree/master/tex). 

## Czcionki
Domyślną czcionką jest [Adobe Utopia](https://ctan.org/pkg/fourier), która jest zgodna z wymaganiami wydziału i zapewnia wszystkie niezbędne interfejsy. Możliwe jest użycie innych czcionek, jednak ja nie widzę takiego powodu. 

 
## Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y](https://github.com/ArturB/WUT-Thesis/issues) na GitHubie. Pisz tam, jeżeli masz jakiś problem. 
 
## Uwagi
Copyright by Artur M. Brodzki 2019, based on https://github.com/pwozniak/EiTI-Szablon by [Piotr Woźniak](https://github.com/pwozniak). 
