% Custom Datasheet Style
% Custom Letter Class
% Written by Matthew Santos (Inspired by Analog Devices)
%---------------------------

% Class Definition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{datasheet}[2024/11/27 Datasheet LaTeX class]

% Packages
\LoadClass[11pt]{article} % [10pt,12pt]
\RequirePackage[includeheadfoot,letterpaper,margin=0.7in,top=0.5in]{geometry} % Canada/USA
\RequirePackage[english]{babel} % Language Typography
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[raggedright]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage{graphicx}
\RequirePackage{fontspec}
\RequirePackage{multicol}
\RequirePackage[smartEllipses]{markdown}
\RequirePackage{lastpage}

% Set Font (Arial Narrow)
\defaultfontfeatures[ARIALN]{
	UprightFont=*,
	BoldFont=*B,
	ItalicFont=*I,
	BoldItalicFont=*BI,
	Extension=.ttf }
\setmainfont{ARIALN}
\setsansfont{ARIALN}

% Define Header and Footer
\pagestyle{fancy}
\fancypagestyle{firstpage}{%
	\fancyhead[L]{\includegraphics[height=2cm]{images/logo.png}}
	\fancyhead[C]{}
	\fancyhead[R]{{\large\color{gray}Data Sheet}\\ \huge\color{blue}\textbf{PROJECT NAME}}
	\fancyfoot[L]{\today}
	\fancyfoot[C]{}
	\fancyfoot[R]{\thepage~of~\pageref{LastPage}}
}
\fancypagestyle{subsequentpages}{%
	\fancyhead[C]{}
	\fancyhead[R]{\huge\color{blue}\textbf{PROJECT NAME}}
	\fancyhead[L]{{\large\color{gray}Data Sheet}}
	
	\fancyfoot[L]{\today}
	\fancyfoot[C]{}
	\fancyfoot[R]{\thepage~of~\pageref{LastPage}}
}
\AtBeginDocument{\thispagestyle{firstpage}\vspace*{\baselineskip}} % Use the first page headers/footers style on the first page
\pagestyle{subsequentpages} % Use the subsequent pages headers/footers style on subsequent pages

% Section Header Formats
\titleformat{\section}{\Large\color{blue}}{}{0em}{}
\titleformat{\subsection}{\normalfont\scshape}{}{1em}{}
