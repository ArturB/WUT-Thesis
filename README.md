# EiTI-Szablon
Repozytorium zawiera stworzony w LaTeXu szablon pracy dyplomowej: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej. Szablon z założenia powinien być zgodny z normą składu tekstów w języku polskim (BN-76 7440-02), jednakże nie gwarantuję całkowitej zgodności. Istnieją również pewne intencjonalnie wprowadzone różnice (np. sposób listowania) wynikające z tego, że w/w norma jest proweniencji jeszcze komunistycznej i pewne rzeczy się zdezaktualizowały. 

Oprócz wymaganej przepisami strony tytułowej, streszczeń i deklaracji o autorstwie, w dokumencie zawarte są przykładowe fragmenty kodu:
 - obrazek z podpisem;
 - wzory matematyczne z numeracją lub bez, w tym równanie macierzowe;
 - lista nieuporządkowana oraz numerowana, z regulowanym wzorem elementów oraz wcięciem;
 - prosta tabela z podpisem;
 - duża tabela wielostronicowa, z regulowaną szerokością kolumn i zagnieżdżaniem (multirow);
 - twierdzenia, aksjomaty i definicje;
 - fragment kodu źródłowego programu;
 - bibliografia w BibTeX;
 - spis tabel oraz rysunków.
 
 [Tutaj](https://github.com/ArturB/EiTI-Szablon/blob/master/main.pdf) dostępny podgląd w formacie PDF. Najnowsza wersja szablonu gotowa do kompilacji jest zawsze dostępna pod adresem https://github.com/ArturB/EiTI-Thesis/releases/download/latest/EiTI-Thesis.zip. 
 
 ## Kompilacja i kompatybilność
Możliwa jest kompilacja z użyciem trzech głównych kompilatorów LaTeXa: [pdfTeX](https://www.tug.org/applications/pdftex/), [XeTeX](http://xetex.sourceforge.net/) oraz [LuaTeX](http://www.luatex.org/). Kompilatory XeTeX oraz LuaTeX dają możliwość stosowania własnych czcionek, czego nie zapewnia pdfTeX. Kompilacja na pdfTeX oraz LuaTeX daje te same rezultaty, co - dzięki zastosowaniu techniki microtypingu i innych takich bajerów - gwarantuje epicki wygląd całego dokumentu. Niestety, na XeTeX-u niedostępna jest część niskopoziomowych funkcji TeX-a, przez co, jeśli chodzi o końcowy rezultat, jestem w stanie zagwarantować co najwyżej dramat. Dlatego, jeżeli masz potrzebę zastosowania innego kompilatora niż pdfTeX (do czego nie zachęcam, bo nie ma po co) - to ogranicz się raczej do LuaTeX-a. 

Szablon testowałem w następujących konfiguracjach:
 - na Windowsie w MikTeX oraz TeX Live;
 - na Linuxie w TeX Live.
 
 W innych środowiskach póki co nie próbowałem, w szczególności nie gwarantuję wsparcia dla systemów Apple'a. Z MacOS-em radzisz sobie więc sam(a). 

 ## Czcionki
Domyślną czcionką jest [Adobe Utopia](https://ctan.org/pkg/fourier)), która jest zgodna z wymaganiami wydziału i zapewnia wszystkie niezbędne interfejsy. Możliwe jest użycie innych czcionek jednak ja nie widzę takiego powodu. 
 
 ## Kontrola wersji
Szablon jest zoptymalizowany pod użycie z systemem kontroli wersji git oraz pracę z wykorzystaniem [TeX Studio](https://www.texstudio.org/). Możliwa - i zalecana przy większych dokumentach - jest praca w systemie wieloplikowym: po jednym pliku na każdy rozdział. Pliki z rozdziałami zawartymi w szablonie znajdują się w katalogu [tex](https://github.com/ArturB/EiTI-Szablon/tree/master/tex).
 
 ## Problemy
 Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y](https://github.com/ArturB/EiTI-Thesis/issues) na GitHubie. Pisz tam, jeżeli masz jakiś problem. 
 
 ## Uwagi
 Copyright by Artur M. Brodzki, based on https://github.com/pwozniak/EiTI-Szablon by [Piotr Woźniak](https://github.com/pwozniak). 
