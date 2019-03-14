%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Master Thesis, LaTeX Template Class              %%
%% Copyleft by Piotr Wozniak & Artur M. Brodzki     %%
%% Faculty of Electronic and Information Technology %%
%% Warsaw University of Technology, Warsaw, 2019    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{eiti-mgr}

% Load base
\LoadClass[12pt]{article}

\RequirePackage{amsmath}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage[T1]{fontenc}
\RequirePackage{fourier}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{kantlipsum}
\RequirePackage{lipsum}
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage[
	protrusion=true, 
	expansion=true
]{microtype}
\RequirePackage{multirow}
\RequirePackage{sectsty}
\RequirePackage{setspace}
\RequirePackage{pifont}
\RequirePackage{url}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}
\RequirePackage{xspace}

%--------------------------------
% Define and process margin parameter
% Default margin is 2.5 cm
%--------------------------------
\newcommand\margin{2.5cm}
\define@key{eiti/eiti-mgr.cls}{margin}[2.5cm]{
	\def\margin{#1}
}
\ExecuteOptionsX{margin}
\ProcessOptionsX
\usepackage[
	a4paper, 
	margin=\margin
]{geometry}

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

%--------------------------------
% Initial setup
%--------------------------------
\onehalfspacing
\sectionfont{\scshape}

%--------------------------------
% Header & footer
%--------------------------------
\pagestyle{fancy}
\fancyhead{}
\fancyhead[RO]{\nouppercase{\leftmark}}
\fancyhead[LE]{\nouppercase{\rightmark}}
\fancyfoot{}
\fancyfoot[LE,RO]{\thepage}

%--------------------------------
% Strona tytułowa
%--------------------------------
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

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
	\linespread{1.15}
	
	\thispagestyle{plain}
	\pagenumbering{gobble}
	
	\begin{center}
		\sffamily
		\includegraphics[width=\textwidth]{eiti/header.png} \\
		\hfill \break
		\hfill \break
		Instytut \@instytut \\
		\hfill \break
		\hfill \break
		\hfill \break
		\includegraphics[width=\textwidth]{eiti/title-mgr.png} \\
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
% Streszczenie po angielsku
%--------------------------------

\newcommand{\makeauthorship}{
	\thispagestyle{empty}
	\begin{figure}[H]
		\vspace{-55pt}
		\noindent\makebox[\textwidth]{
			\includegraphics[width=1.3\textwidth]{eiti/oswiadczenie.pdf}
		}
	\end{figure}
}




