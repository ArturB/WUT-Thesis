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

%--------------------------------------
% Define class parameters
%--------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=eiti/eiti-thesis.cls,
	prefix=eiti
}

\DeclareStringOption[2.5cm]{left}
\DeclareStringOption[2.5cm]{right}
\DeclareStringOption[2.5cm]{top}
\DeclareStringOption[2.5cm]{bottom}
\DeclareStringOption[6mm]{bindingoffset}
\DeclareBoolOption[false]{nohyphenation}
\ProcessKeyvalOptions*

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
	\RequirePackage{luatexbase}
	\RequirePackage{luacode}
	\RequirePackage[
		protrusion=true,
		expansion=true
	]{microtype}
%	% In LuaTeX, we can prevent one-letter words 
%	% from beging at the end of the line. 
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
	
	\end{luacode} %% po zrobieniu wcięcia,kod przestaje się kompilować !!! 

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
% Default margin is 2.5 cm
%--------------------------------------
\RequirePackage[
	a4paper, 
	left=\eitileft,
	right=\eitiright,
	top=\eititop,
	bottom=\eitibottom,
	bindingoffset=\eitibindingoffset
]{geometry}

%--------------------------------
% Turn off hyphenation
%--------------------------------
\ifeitinohyphenation
	\tolerance=1
	\emergencystretch=\maxdimen
	\hyphenpenalty=10000
	\hbadness=10000
\fi

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
% Set default list style
%--------------------------------
\setlist[itemize,1]{topsep=2pt,label=\large$\bullet$, leftmargin=28pt}
\setlist[itemize,2]{topsep=2pt,leftmargin=18pt}
\setlist[itemize,3]{topsep=2pt,leftmargin=18pt}

\setlist[enumerate,1]{topsep=2pt,leftmargin=24pt}
\setlist[enumerate,2]{topsep=2pt,leftmargin=16pt}
\setlist[enumerate,3]{topsep=2pt,leftmargin=16pt}

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
	\begin{center}\textbf{\large\@engtitle}\end{center}
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
\newcommand{\engtitle}[1]{
	\newcommand{\@engtitle}{#1}
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

%--------------------------------
% Spis załączników - makra
%--------------------------------
\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{%
	\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup
}

\newcommand\listappendicesname{Spis załączników}

\newcommand\newappendix[1]{%
	% \refstepcounter{section}
	\tocless\section{\hspace*{1.5ex} #1}
	\addcontentsline{app}{subsection}{\hspace*{-2.5ex}\arabic{section}.\hspace*{0.5ex} #1}
}
\makeatletter
\newcommand\listofappendices{%
	\section*{\listappendicesname}\@starttoc{app}
	\appendix
	\renewcommand{\thesection}{Załącznik~\arabic{section}}
}
\makeatother

\let\oldappendix\appendix
\renewcommand{\appendix}{
	\oldappendix
	\renewcommand{\thesection}{Załącznik~\arabic{section}}
}
