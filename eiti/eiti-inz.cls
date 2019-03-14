%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Engineer Thesis, LaTeX Template Class            %%
%% Copyleft by Piotr Wozniak & Artur M. Brodzki     %%
%% Faculty of Electronic and Information Technology %%
%% Warsaw University of Technology, Warsaw, 2019    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{eiti-inz}

\LoadClass[12pt]{article}
\input{eiti/eiti-common.cls}

%--------------------------------------
% Define and process margin parameter
% Default margin is 2.5 cm
%--------------------------------------
\newcommand\margin{2.5cm}
\define@key{eiti/eiti-inz.cls}{margin}[2.5cm]{
	\def\margin{#1}
}
\ExecuteOptionsX{margin}
\ProcessOptionsX
\usepackage[
	a4paper, 
	margin=\margin
]{geometry}

%--------------------------------
% Strona tytułowa
%--------------------------------
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
		\includegraphics[width=\textwidth]{eiti/title-inz.png} \\
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

