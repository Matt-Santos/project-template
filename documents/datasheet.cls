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
