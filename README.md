# WUT-Thesis ![CI](https://github.com/ArturB/WUT-Thesis/workflows/CI/badge.svg)

Repozytorium zawiera szablon pracy dyplomowej w LateXu: inżynierskiej oraz magisterskiej - przeznaczony dla Wydziału EiTI oraz Wydziału MEiL Politechniki Warszawskiej.

### Linki:
[ref:issues]: https://github.com/ArturB/WUT-Thesis/issues
[ref:main-tex]: https://github.com/ArturB/WUT-Thesis/blob/master/main.tex
[ref:miktex]: https://miktex.org/
[ref:overleaf]: https://www.overleaf.com/latex/templates/wut-thesis/vfvvdqztfqbt
[ref:poradnik-ii]: http://www.ii.pw.edu.pl/index.php/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta/Przygotowanie-pracy-dyplomowej
[ref:scons]: https://scons.org/
[ref:texlive]: https://www.tug.org/texlive/
[ref:vscode]: https://code.visualstudio.com/
[ref:wiki]: https://github.com/ArturB/WUT-Thesis/wiki
[ref:workshop]: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop
[ref:wymogi-edytorskie]: https://www.bip.pw.edu.pl/var/pw/storage/original/application/235c0fd350f44cd00253ecdfa22bae61.pdf

*  [>> Overleaf <<][ref:overleaf]
* [Wymogi edytorskie (Zarządzenie Rektora, 2022)][ref:wymogi-edytorskie]
* [Wskazówki dot. kompilacji][ref:wiki]

![](https://i.imgur.com/yeeuWpC.png)

----

## Sposób użycia
Szablon jest dostępny na platformie webowej [Overleaf][ref:overleaf], co umożliwia korzystanie z niego bez konieczności instalacji TeXa na własnej maszynie. Jest to **najprostsza i rekomendowana** metoda korzystania z szablonu.

~~Czasami~~ Zazwyczaj ~~może się zdarzyć~~ jest tak, że wersja dostępna na Overleafie jest ~~nieco~~ sporo starsza niż ta znajdująca się na GitHubie. Wynika to z procesu aktualizacji tj. ręcznego zatwierdzania każdej zmiany przez administratorów Overleafa. Jeżeli chcesz korzystać z najnowszej wersji szablonu, możesz pobrać kod z repozytorium i zainstalować TeXa we własnym zakresie. Szczegółowe wskazówki i instrukcje znajdują się w zakładce [Kompilacja](#Kompilacja) oraz na [Wiki](ref:wiki).

## Wydziały oraz języki
Szablon przeznaczony jest dla wydziału EiTI oraz MEiL Politechniki Warszawskiej, a prace dyplomowe można pisać w języku polskim lub angielskim.
Wyboru wydziału oraz języka dokonujemy w pliku [main.tex](ref:main-tex). Wybór wydziału (a tym samym wygląd strony tytułowej) określamy komendą

```
\facultyeiti
```

lub

```
\facultymeil
```

natomiast język wybieramy za pomocą komendy

```
\langpol
```

lub

```
\langeng
```

## Status szablonu
Szablon jest zgodny z aktualnymi wymogami edytorskimi dla prac dyplomowych, określonych w [Zarzadzeniu nr. 4/2022 Rektora PW](ref:wymogi-edytorskie) i zawiera wszystkie wymagane elementy: stronę tytułową, streszczenia, deklarację o autorstwie.

Poniższa tabela podsumowuje status zgodności szablonu z w/w Zarządzeniem. Wiersze pogrubione oznaczają elementy formatowania, które wg. Zarządzenia są "wymagane" lub "do wyboru" (spośród kilku opcji), pozostałe elementy formatowania są określone jako "zalecane".

| Element formatowania           | Status                                              |
|--------------------------------|-----------------------------------------------------|
| **Druk dwustronny, A4**        | **Jest**                                            |
| Margines wewnętrzny            | 30 mm                                               |
| Margines zewnętrzny            | 25 mm                                               |
| Margines górny i dolny         | 25 mm                                               |
| Krój pisma                     | Adobe Utopia, 12 pt                                 |
| Interlinia                     | 1,15                                                |
| **Numeracja stron**            | **U dołu z odbiciem lustrzanym**                    |
| **Styl akapitu**               | **Wcięcie 0,5 cm**                                  |
| **Odwołania do źródeł**        | **Styl numeracyjny**                                |
| **Numeracja tabel i rysunków** | **Kolejna w rozdziałach**                           |
| Bibliografia                   | Styl numeracyjny                                    |
| Tytuł tabeli                   | Nad tabelą,    wyśrodkowany, 9 pt                   |
| Podpis rysunku                 | Pod rysunkiem, wyśrodkowany, 9 pt                   |
| **Podrozdziały**               | **Do 3 poziomów**                                   |
| Wyliczenia                     | Dostępne: wyliczenia numerowane, kropka lub myślnik |
| Przypis dolny                  | Numeracja ciągła, czcionka 9 pt                     |

W dokumencie zawarte są przykładowe fragmenty kodu:
- bibliografia, zawierająca różne typy źródeł: artykuł, książka lub jej fragment, raport, specyfikacja techniczna, repozytorium kodu;
- fragment kodu źródłowego programu;
- wykaz symboli i skrótów, spis rysunków, tabel oraz załączników;

i wiele innych.

Szablon został zatwierdzony przez [niektóre Instytuty][ref:poradnik-ii] wydziału EiTI do oficjalnego użytku. W trakcie realizacji są ustalenia z pozostałymi instytutami oraz podniesienie szablonu do rangi ogólnowydziałowego.

## Kompilacja
Aby skompilować szablon na własnej maszynie, konieczna jest instalacja LaTeXa:
- [texlive][ref:texlive] lub [MikTeX][ref:miktex] na Windowsie;
- [texlive][ref:texlive] na Linuxie.

Następnie należy wyposażyć się w IDE/edytor. Szablon jest rozwijany z użyciem [VS Code][ref:vscode], wyposażonym we wtyczkę [LaTeX Workshop][ref:workshop]. Możliwa jest również kompilacja z linii poleceń za pomocą [SCons][ref:scons] (wymagany Python).

Aby zbudować plik PDF z pracą dyplomową, wystarczy z linii poleceń w głównym folderze projektu wykonać:

```
scons quick
```

Plik PDF z pracą dyplomową pojawi się w głównym folderze projektu.

Szczegółowe informacje nt. samodzielnej kompilacji szablonu i rozwiązania ew. problemów znajdują w [encyklopedii projektu][ref:wiki].

## Problemy
Preferowanym kanałem zgłaszania problemów z szablonem są [issues-y][ref:issues] na GitHubie. Pisz tam, jeżeli masz jakiś problem.

## Dla deweloperów
Informacje dla osób zainteresowanych rozwijaniem szablonu znajdują się w [encyklopedii projektu][ref:wiki].

## Uwagi
Copyleft © [Artur M. Brodzki](https://github.com/ArturB) 2019-2023. Loosely based on [EiTI-Szablon](https://github.com/pwozniak/EiTI-Szablon) by [Piotr Woźniak](https://github.com/pwozniak). All wrongs reserved.
