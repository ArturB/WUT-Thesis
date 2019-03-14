# EiTI-Szablon
Repozytorium zawiera stworzony w LaTeXu szablon pracy dyplomowej: inżynierskiej lub magisterskiej - przeznaczony dla Wydziału EiTI Politechniki Warszawskiej. Oprócz wymaganej przepisami strony tytułowej, streszczeń i deklaracji o autorstwie, w dokumencie zawarte są przykładowe fragmenty kodu:
 - obrazek z podpisem
 - wzory matematyczne z numeracją lub bez, w tym równanie macierzowe
 - prosta tabela z podpisem
 - duża tabela wielostronicowa, z regulowaną szerokością kolumn i zagnieżdżaniem (multirow)
 - bibliografia w BibTeX
 [Tutaj](https://github.com/ArturB/EiTI-Szablon/blob/master/main.pdf) dostępny podgląd w formacie PDF. 
 
 ## Kompilacja i kompatybilność
Możliwa jest kompilacja z użyciem trzech głównych kompilatorach LaTeXa: [pdfLaTeX](https://www.tug.org/applications/pdftex/), [XeTeX](http://xetex.sourceforge.net/) oraz [LuaTeX](http://www.luatex.org/). Kompilatory XeTeX oraz LuaTeX dają możliwość stosowania własnych czcionek, czego nie zapewnia pdfLaTeX. Szablon daje się skompilować na Windowsie w [MikTeX](https://miktex.org/) oraz na Linuxie w [TeX Live](https://www.tug.org/texlive/). W innych konfiguracjach póki co nie próbowałem.

 ## Czcionki
Domyślnie używaną czcionką jest Adobe Utopia (pakiet [fourier](https://ctan.org/pkg/fourier)), która zapewnia wszystkie niezbędne interfejsy. Możliwe jest użycie innych czcionek, w katalogu [fonts](https://github.com/ArturB/EiTI-Szablon/tree/master/fonts) zawarte są następujące czcionki:
  - Adagio Slab: oficjalna czcionka PW, zgodna z tzw. [Systemem Identyfikacji Wizualnej](https://www.promocja.pw.edu.pl/Marka-PW/System-Identyfikacji-Wizualnej). Teoretycznie powinna być używana jako domyslna czcionka we wszystkich dokumentach sygnowanych logo PW;
  - Times New Roman, stary, ale jary; 
  - Arial, znany z MS Worda. 
 
 ## Kontrola wersji
Szablon jest zoptymalizowany pod użycie z systemem kontroli wersji git. Możliwa - i zalecana przy większych dokumentach - jest praca w systemie wieloplikowym: po jednym pliku na każdy rozdział. Pliki z rozdziałami widocznymi w szablonie znajdują się w katalogu [tex](https://github.com/ArturB/EiTI-Szablon/tree/master/tex).
 
 ## Uwagi
 Copyright by Artur M. Brodzki, based on [https://github.com/pwozniak/EiTI-Szablon] by [Piotr Woźniak](https://github.com/pwozniak). 
