%%------------------------------------------------%%
%%  Engineer's & Master's Thesis Template         %%
%%  Copyleft by Artur M. Brodzki & Piotr Woźniak  %%
%%  Warsaw University of Technology, 2019-2022    %%
%%------------------------------------------------%%

\ProvidesClass{src/wut-thesis}

\LoadClass[
    12pt,
    twoside
]{mwart}

%----------------------------
% Document class parameters
%----------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=wut/wut-thesis.cls,
    prefix=wut
}
\DeclareStringOption[5mm]{bindingoffset}
\DeclareStringOption[4mm]{footnoteindent}
\DeclareBoolOption[true]{hyphenation}
\ProcessKeyvalOptions*
% Hyphenation
\ifwuthyphenation
\else
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
    \hbadness=10000
\fi
% Required by caption package
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%---------------------
% Basic dependencies
%---------------------
\RequirePackage{amsmath}       % Basic mathematical typesetting
\RequirePackage{amssymb}       % Advanced math symbols
\RequirePackage{amsthm}        % Theorems typesetting
\RequirePackage{array}         % Advanced table column formats
\RequirePackage{enumitem}      % Itemize/enumrate
\RequirePackage{fancyhdr}      % Custom header/footer styles
\RequirePackage{fourier}       % Adobe Utopia font
\RequirePackage{graphicx}      % Enhanced images support
\RequirePackage{ifluatex}      % LuaTeX-specific options
\RequirePackage{kantlipsum}    % English kantian-style lipsum
\RequirePackage{lipsum}        % Lorem ipsum
\RequirePackage{listings}      % Code listings
\RequirePackage{longtable}     % Multi-page tables
\RequirePackage{multirow}      % Advanced table cells
\RequirePackage{setspace}      % Set space between lines
\RequirePackage{scrextend}     % Allows \addmargin environment
\RequirePackage{tablefootnote} % Table footnotes
\RequirePackage{tocloft}       % Custom ToC/LoF/LoT
\RequirePackage{url}           % URL-sensitive line breaks
\RequirePackage{xspace}        % Remove duplicated spaces

%----------------------------
% Parametrized dependencies
%----------------------------
% Bibliography in biber
\RequirePackage[
    backend=biber,
    style=ieee
]{biblatex}
% Custom figure and table captions
\RequirePackage[
    font=small,
    labelfont=bf,
    labelsep=period
]{caption}
% Custom footnote typesetting
\RequirePackage[
    hang
]{footmisc}
\setlength{\footnotemargin}{\wutfootnoteindent}
% A4 paper and margins
\RequirePackage[
    a4paper,
    left=25mm,
    right=25mm,
    top=25mm,
    bottom=25mm,
    bindingoffset=\wutbindingoffset
]{geometry}
% Clickable hyperlinks
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}
% Advanced interword spacing
\RequirePackage[
    protrusion=true,
    expansion=true
]{microtype}

%-----------------------
% LuaTeX specific code
%-----------------------
\ifluatex
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{luainputenc}
    \RequirePackage{luacode}
    % In LuaTeX, we can prevent one-letter words
    % from beging at the end of the line.
    \begin{luacode}
    local debug = false
    local glyph_id = node.id "glyph"
    local glue_id  = node.id "glue"
    local hlist_id = node.id "hlist"

    local prevent_single_letter = function (head)
        while head do
            if head.id == glyph_id then
                if unicode.utf8.match(unicode.utf8.char(head.char),"%a") then     -- is a letter
                    if head.prev.id == glue_id and head.next.id == glue_id then   -- is one letter word

                        local p = node.new("penalty")
                        p.penalty = 10000

                        if debug then
                            local w = node.new("whatsit","pdf_literal")
                            w.data = "q 1 0 1 RG 1 0 1 rg 0 0 m 0 5 l 2 5 l 2 0 l b Q"
                            node.insert_after(head,head,w)
                            node.insert_after(head,w,p)
                        else
                            node.insert_after(head,head,p)
                        end
                    end
                end
            end
            head = head.next
        end
        return true
    end

    luatexbase.add_to_callback("pre_linebreak_filter",prevent_single_letter,"~")
    \end{luacode}
\fi

%----------------------
% Basic configuration
%----------------------
\setstretch{1.15}
\setlength{\parindent}{5mm}
\counterwithin{equation}{section}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
% List formatting
\setlist[itemize,1]{topsep=2pt,label=\large$\bullet$, leftmargin=28pt}
\setlist[itemize,2]{topsep=2pt,leftmargin=18pt}
\setlist[itemize,3]{topsep=2pt,leftmargin=18pt}
\setlist[enumerate,1]{topsep=2pt,leftmargin=24pt}
\setlist[enumerate,2]{topsep=2pt,leftmargin=16pt}
\setlist[enumerate,3]{topsep=2pt,leftmargin=16pt}
% Section header formatting
\SetSectionFormatting{section}{0.5cm}{\FormatHangHeading{\Large}}{0.5cm}
\let\oldsection\section
\renewcommand{\section}{
	\thispagestyle{plain}
	\oldsection
}

%------------------
% Header & footer
%------------------
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}
\fancypagestyle{headings}{
	\fancyhead{}
	\renewcommand{\headrulewidth}{1pt}
	\fancyheadoffset{0cm}
	\fancyhead[RO]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyhead[LE]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyfoot[LE,RO]{\thepage}
}
% Section number in header
\renewcommand{\sectionmark}[1]{
	\markboth{#1}{#1}
}

%---------------------
% Wybór języka pracy
%---------------------
\newcommand{\langpol}{
    \newcommand{\@lang}{pl}
    \usepackage[polish]{babel}
    \usepackage{csquotes}

	\newtheorem{theorem}{Twierdzenie}
	\newtheorem{lemma}{Lemat}
	\newtheorem{corollary}{Wniosek}
	\newtheorem{definition}{Definicja}
	\newtheorem{axiom}{Aksjomat}
	\newtheorem{assumption}{Założenie}

	\AtBeginDocument{
		\renewcommand{\listfigurename}{Spis rysunków}
		\renewcommand{\listtablename}{Spis tabel}
		\renewcommand{\tablename}{Tabela}
	}
}
\newcommand{\langeng}{
    \newcommand{\@lang}{en}
    \usepackage[english]{babel}
    \usepackage{csquotes}

	\newtheorem{theorem}{Theorem}
	\newtheorem{lemma}{Lemma}
	\newtheorem{corollary}{Corollary}
	\newtheorem{definition}{Definition}
	\newtheorem{axiom}{Axiom}
	\newtheorem{assumption}{Assumption}

	\AtBeginDocument{
		\renewcommand{\listfigurename}{List of Figures}
		\renewcommand{\listtablename}{List of Tables}
		\renewcommand{\tablename}{Table}
	}
}

%-----------------
% Wybór wydziału
%-----------------
\newcommand{\facultyeiti}{
    \newcommand{\@faculty}{eiti}
}
\newcommand{\facultymeil}{
    \newcommand{\@faculty}{meil}
}

%--------------------------
% Strona tytułowa - makra
%--------------------------
\newcommand{\EngineerThesis}{
    \newcommand{\@ThesisType}{inz}
}
\newcommand{\MasterThesis}{
    \newcommand{\@ThesisType}{mgr}
}
\newcommand{\instytut}[1]{
    \newcommand{\@instytut}{#1}
}
\newcommand{\kierunek}[1]{
    \newcommand{\@kierunek}{#1}
}
\newcommand{\specjalnosc}[1]{
    \newcommand{\@specjalnosc}{#1}
}
\newcommand{\album}[1]{
    \newcommand{\@album}{#1}
}
\newcommand{\promotor}[1]{
    \newcommand{\@promotor}{#1}
}
\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}
\newcommand{\poltitle}[1]{
    \newcommand{\@poltitle}{#1}
}

%------------------
% Strona tytułowa
%------------------
\renewcommand{\maketitle}{
    \linespread{1.15}

    \thispagestyle{empty}
    \pagenumbering{gobble}

    \begin{center}
        \includegraphics[width=\textwidth]{src/\@lang/header/\@faculty.pdf} \\
        \vspace{3em}
        \ifnum \pdf@strcmp{\@lang}{pl} = 0
            Instytut \@instytut \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{en} = 0
            Institute of \@instytut \\
        \fi
        \vspace{4em}
        \includegraphics[width=\textwidth]{src/\@lang/title/\@ThesisType.pdf} \\
        \vspace{2em}
        \ifnum \pdf@strcmp{\@lang}{pl} = 0
            na~kierunku \@kierunek \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{en} = 0
            in~the~field~of~study \@kierunek \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{pl} = 0
            w~specjalności \@specjalnosc \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{en} = 0
            and~specialisation \@specjalnosc \\
        \fi
        \vspace{4em}
        \large \@title \\
        \vspace{4em}
        \LARGE \@author \\
        \normalsize
        \ifnum \pdf@strcmp{\@lang}{pl} = 0
            Numer~albumu \@album \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{en} = 0
            student record book number \@album \\
        \fi
        \vspace{4em}
        \ifnum \pdf@strcmp{\@lang}{pl} = 0
            promotor \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{en} = 0
            thesis supervisor \\
        \fi
        \@promotor \\
        \vfill
        \ifnum \pdf@strcmp{\@lang}{pl} = 0
            WARSZAWA \@date
        \fi
        \ifnum \pdf@strcmp{\@lang}{en} = 0
            WARSAW \@date
        \fi
    \end{center}

    \pagenumbering{arabic}
    \setcounter{page}{1}
}

%-------------------------
% Streszczenie po polsku
%-------------------------
\renewcommand{\abstract}{
    \thispagestyle{plain}
    \begin{center}\textbf{\large\@title}\end{center}
    \ifnum \pdf@strcmp{\@lang}{pl} = 0
        \textbf{\\ Streszczenie.\xspace}
    \fi
    \ifnum \pdf@strcmp{\@lang}{en} = 0
        \textbf{\\ Abstract.\xspace}
    \fi
}
\newcommand{\keywords}{
    \ifnum \pdf@strcmp{\@lang}{pl} = 0
        \vspace{0.5cm}\par\noindent \textbf{Słowa kluczowe:\xspace}
    \fi
    \ifnum \pdf@strcmp{\@lang}{en} = 0
        \vspace{0.5cm}\par\noindent \textbf{Keywords:\xspace}
    \fi
}

%----------------------------
% Streszczenie po angielsku
%----------------------------
\newcommand{\secondabstract}{
    \thispagestyle{plain}
    \ifnum \pdf@strcmp{\@lang}{pl} = 0
        \begin{center}\textbf{\large\@engtitle}\end{center}
        \textbf{\\ Abstract.\xspace}
    \fi
    \ifnum \pdf@strcmp{\@lang}{en} = 0
        \begin{center}\textbf{\large\@poltitle}\end{center}
        \textbf{\\ Streszczenie.\xspace}
    \fi
}
\newcommand{\secondkeywords}{
    \ifnum \pdf@strcmp{\@lang}{pl} = 0
        \vspace{0.5cm}\par\noindent \textbf{Keywords:\xspace}
    \fi
    \ifnum \pdf@strcmp{\@lang}{en} = 0
        \vspace{0.5cm}\par\noindent \textbf{Słowa kluczowe:\xspace}
    \fi
}

%----------------------------
% Oświadczenie o autorstwie
%----------------------------
\newcommand{\makeauthorship}{
    \thispagestyle{plain}
    \begin{figure}[ht]
        \vspace{-55pt}
        \noindent\makebox[\textwidth]{
        \includegraphics[width=1.19\textwidth]{src/\@lang/authorship/\@faculty.pdf}
        }
    \end{figure}
}

%----------------------------
% Oświadczenie o licencji
%----------------------------
\newcommand{\makelicense}{
    \thispagestyle{plain}
    \begin{figure}[ht]
        \vspace{-55pt}
        \noindent\makebox[\textwidth]{
        \includegraphics[width=1.19\textwidth]{src/\@lang/license/\@faculty.pdf}
        }
    \end{figure}
}

%--------------------------
% Table of Contents setup
%--------------------------
\setlength{\cftbeforesecskip}{2pt}
\renewcommand{\cftsecfont}{\bf\normalsize}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}

%------------------------
% List of Figures setup
%------------------------
\renewcommand*\l@figure{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoffigurestoc}{
    \listoffigures
    \addcontentsline{toc}{section}{\listfigurename}
}

%-----------------------
% List of Tables setup
%-----------------------
\renewcommand*\l@table{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoftablestoc}{
    \listoftables
    \addcontentsline{toc}{section}{\listtablename}
}

%--------------------------
% Skrót (akronim) - makro
%--------------------------
\newcommand{\acronymlist}{
    \ifnum \pdf@strcmp{\@lang}{pl} = 0
        \section*{Wykaz symboli i skrótów}
    \fi
    \ifnum \pdf@strcmp{\@lang}{en} = 0
        \section*{List of Symbols and Abbreviations}
    \fi
}
\newcommand{\acronym}[2]{
    \par\noindent\hspace{0.4em}
    {\textbf{#1} -- #2}
}

%-------------------
% Spis załączników
%-------------------
\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{%
    \bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup
}

\newcommand{\@appendixtitle}{
    \ifnum \pdf@strcmp{\@lang}{pl} = 0
        Załącznik
    \fi
    \ifnum \pdf@strcmp{\@lang}{en} = 0
        Appendix
    \fi
}

\let\standardappendix\appendix
\renewcommand\appendix[1]{%
    \refstepcounter{section}
    \tocless{\section*}{\@appendixtitle~\arabic{section}.\hspace*{0.5em} #1}
    \addcontentsline{app}{subsection}{\hspace*{-1.1em}\arabic{section}.\hspace*{0.5em} #1}
}

\newcommand\listofappendicestoc{
    \ifnum \pdf@strcmp{\@lang}{pl} = 0
        \section*{Spis załączników}\@starttoc{app}
    \fi
    \ifnum \pdf@strcmp{\@lang}{en} = 0
        \section*{List of Appendices}\@starttoc{app}
    \fi

    \standardappendix
    \renewcommand{\thesection}{\arabic{section}}
}
