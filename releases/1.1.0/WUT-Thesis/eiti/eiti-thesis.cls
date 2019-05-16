%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Engineer & Master Thesis LaTeX Template Class     %%
%% Copyleft by Piotr Wozniak & Artur M. Brodzki      %%
%% Faculty of Electronics and Information Technology %%
%% Warsaw University of Technology, Warsaw, 2019     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{eiti/eiti-thesis}

\LoadClass[
	12pt, 
	twoside
]{mwart}

%--------------------------------
% Common packages
%--------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{array} 
\RequirePackage[
	labelfont=bf,
	labelsep=period
]{caption}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{fourier}
\RequirePackage{graphicx}
\RequirePackage{ifluatex}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{kantlipsum}
\RequirePackage{lipsum}
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{setspace}
\RequirePackage{tgadventor}
\RequirePackage{url}
\RequirePackage{xkeyval}
\RequirePackage{xspace}

%--------------------------------------
% PdfTeX specific configuration
%--------------------------------------
\ifpdf
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[
		protrusion=true,
		expansion=true
	]{microtype}
\fi

%--------------------------------------
% XeTeX specific configuration
%--------------------------------------
\ifxetex
	\RequirePackage{fontspec-xetex}
	\RequirePackage[
		protrusion=true,
	]{microtype}
\fi

%--------------------------------------
% LuaTeX specific configuration
%--------------------------------------
\ifluatex
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{luainputenc}
	\RequirePackage[
		protrusion=true,
		expansion=true
	]{microtype}
\fi

%--------------------------------
% Define hyperref colors
%--------------------------------
\RequirePackage{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=black
}

%--------------------------------------
% Define and process class parameters
% Default margin is 2.5 cm
%--------------------------------------
\define@key{eiti/eiti-thesis.cls}{left}[2.5cm]{
	\def\@left{#1}
}
\define@key{eiti/eiti-thesis.cls}{right}[2.5cm]{
	\def\@right{#1}
}
\define@key{eiti/eiti-thesis.cls}{top}[2.5cm]{
	\def\@top{#1}
}
\define@key{eiti/eiti-thesis.cls}{bottom}[2.5cm]{
	\def\@bottom{#1}
}
\define@key{eiti/eiti-thesis.cls}{bindingoffset}[0cm]{
	\def\@bindingoffset{#1}
}
\ExecuteOptionsX{left}
\ExecuteOptionsX{right}
\ExecuteOptionsX{top}
\ExecuteOptionsX{bottom}
\ExecuteOptionsX{bindingoffset}
\ProcessOptionsX
\RequirePackage[
	a4paper, 
	left=\@left,
	right=\@right,
	top=\@top,
	bottom=\@bottom,
	bindingoffset=\@bindingoffset
]{geometry}

%--------------------------------
% Initial setup
%--------------------------------
\setstretch{1.2}
\SetSectionFormatting{section}{0.5cm}{\FormatHangHeading{\Large}}{0.5cm}
\let\oldsection\section
\renewcommand{\section}{
	\thispagestyle{plain}
	\oldsection
}
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}

%--------------------------------
% Header & footer
%--------------------------------
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{
	\markboth{#1}{#1}
}

\fancyhead{}
\fancyheadoffset{0cm} 
\fancyhead[RO]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
\fancyhead[LE]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
\fancyfoot{}
\fancyfoot[LE,RO]{\thepage}

%--------------------------------
% Streszczenie po polsku
%--------------------------------
\newcommand{\streszczenie}{
	\thispagestyle{empty}
	\begin{center}\textbf{\large\@title}\end{center}
	\textbf{\\ Streszczenie.\xspace}
}
\newcommand{\slowakluczowe}{\vspace{0.5cm}\par\noindent \textbf{Słowa kluczowe: \xspace}}

%--------------------------------
% Streszczenie po angielsku
%--------------------------------
\renewcommand{\abstract}{
	\thispagestyle{empty}
	\begin{center}\textbf{\large\@title}\end{center}
	\textbf{\\ Abstract.\xspace}
}
\newcommand{\keywords}{\vspace{0.5cm}\par\noindent \textbf{Keywords: \xspace}}

%--------------------------------
% Oświadczenie o autorstwie
%--------------------------------
\newcommand{\makeauthorship}{
	\thispagestyle{empty}
	\begin{figure}[H]
		\vspace{-55pt}
		\noindent\makebox[\textwidth]{
			\includegraphics[width=1.3\textwidth]{eiti/oswiadczenie_autora_pracy.pdf}
		}
	\end{figure}
}

%--------------------------------
% Strona tytułowa - makra
%--------------------------------
\newcommand{\EngineerThesis}{
	\newcommand{\ThesisType}{Engineer}
}
\newcommand{\MasterThesis}{
	\newcommand{\ThesisType}{Master}
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

%--------------------------------
% Strona tytułowa
%--------------------------------
\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
	\linespread{1.15}
	
	\thispagestyle{empty}
	\pagenumbering{gobble}
	
	\begin{center}
		%\sffamily
		\includegraphics[width=\textwidth]{eiti/header.png} \\
		\hfill \break
		\hfill \break
		Instytut \@instytut \\
		\hfill \break
		\hfill \break
		\hfill \break
		\ifnum \pdf@strcmp{\ThesisType}{Engineer} = 0
			\includegraphics[width=\textwidth]{eiti/title-inz.png} \\
		\fi
		\ifnum \pdf@strcmp{\ThesisType}{Master} = 0
			\includegraphics[width=\textwidth]{eiti/title-mgr.png} \\
		\fi
		\hfill \break
		na~kierunku \@kierunek \\
		w~specjalności \@specjalnosc \\
		\hfill \break
		\hfill \break
		\large
		\@title \\
		\hfill \break
		\hfill \break
		\LARGE
		\@author \\
		\normalsize
		Numer~albumu \@album \\
		\hfill \break
		\hfill \break
		promotor \\
		\@promotor \\
		\vfill
		WARSZAWA \@date
	\end{center}
	
	\newpage
	\thispagestyle{empty}
	\hfill
	\newpage
	
	\pagenumbering{arabic}
	\setcounter{page}{3}
}


%--------------------------------
% Pusta strona - makro
%--------------------------------
\newcommand{\blankpage}{
	\newpage
	\thispagestyle{empty}
	\ 
	\newpage
}

%--------------------------------
% Skrót (akronim) - makro
%--------------------------------
\newcommand{\acronym}[2]{
	\noindent
	\textbf{#1} -- #2
	\newline
}

