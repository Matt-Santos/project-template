% Custom Datasheet Style
% Custom Letter Class
% Written by Matthew Santos (Inspired by Analog Devices)
%---------------------------

% Class Definition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{datasheet}[2024/11/27 Datasheet LaTeX class]

% Packages
\LoadClass[11pt]{article} % [10pt,12pt]
\RequirePackage[letterpaper,margin=1in]{geometry} % Canada/USA
\RequirePackage[english]{babel} % Language Typography
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[raggedright]{titlesec}
\usepackage{fancyhdr}
\RequirePackage{enumitem}
\usepackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage{graphicx}
\usepackage{fontspec}
\usepackage{multicol}
\usepackage[smartEllipses]{markdown}
\usepackage{lastpage}

% Set Font (Arial Narrow)
\defaultfontfeatures[ARIALN]{
	UprightFont=*,
	BoldFont=*B,
	ItalicFont=*I,
	BoldItalicFont=*BI,
	Extension=.ttf }
\setmainfont{ARIALN}
\setsansfont{ARIALN}

% Define Regular Header
\pagestyle{fancy}
\fancypagestyle{firstpage}{%
	\fancyhead[C]{}
	\fancyhead[R]{Data Sheet\\ \LARGE\color{blue}\textbf{PROJECT NAME}}
	%\fancyhead[L]{\includegraphics{images/project.png}}
	
	\fancyfoot[L]{From: K. Grant}
	\fancyfoot[C]{To: Dean A. Smith}
	\fancyfoot[R]{\thepage~of~\pageref{LastPage}}
}

\fancypagestyle{subsequentpages}{%
	\fancyhead[C]{}
	%\fancyhead[R]{\Large\MakeUppercase\bfseries\color{blue}\uppercase{Project Name}}
	\fancyhead[L]{Data Sheet}
	
	\fancyfoot[L]{From: K. Grant}
	\fancyfoot[C]{To: Dean A. Smith}
	\fancyfoot[R]{\thepage~of~\pageref{LastPage}}
}
\AtBeginDocument{\thispagestyle{firstpage}} % Use the first page headers/footers style on the first page
\pagestyle{subsequentpages} % Use the subsequent pages headers/footers style on subsequent pages



% Define Footer

% Section Header Formats
\titleformat{\section}{\Large\color{blue}}{}{0em}{}
\titleformat{\subsection}{\normalfont\scshape}{}{1em}{}
