%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[left=0.2in,top=0.2in,right=0.2in,bottom=0.2in]{geometry} % Document margins
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{multicol} % Columns for coursework
\usepackage{enumitem}
\setlist{leftmargin=4mm}

\pagestyle{empty} % Suppress page numbers

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
\def\leftspace{0.0em}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\let \@addressfour \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
 \@ifundefined(@addressfour){
 \def \@addressfour {#1}
 }{
     \def \@addressone {#1}
  }}}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \leftline{#1}
  \endgroup
  \par
  \addressskip
}

% \printheader is used to print the header as a page header
\def \printheader {
  \begin{list}{}{
    \setlength{\leftmargin}{\leftspace}
  }
    \item{\MakeUppercase{\namesize\bf \@name} \hfill
    \@ifundefined{@addressone}{}{ % Print the first address if specified
      \printaddress{\@addressone}}
    \@ifundefined{@addresstwo}{}{ % Print the second address if specified
      \printaddress{\@addresstwo}}
    \@ifundefined{@addressthree}{}{ % Print the third address if specified
      \printaddress{\@addressthree}}
    \@ifundefined{@addressfour}{}{ % Print the four address if specified
      \printaddress{\@addressfour}}
    }
  \end{list}
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printheader % Print the name specified with \name
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{\leftspace} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

\setlength{\multicolsep}{6.0pt plus 2.0pt minus 1.5pt}% 50% of original values

\newenvironment{rSection2}[1]{
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{multicols}{2}
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{\leftspace} % Margin within the section
  }
  \item[]
}{
  \end{list}
  \end{multicols}
  \vspace{-0.25cm}
}


%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{itemize}{}{\leftmargin=5.5mm} % \cdot used for bullets, no indentation
    \renewcommand\labelitemi{-}
    \itemsep -0.2em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{itemize}
  \vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rSubsubsection}[2]{
  \vspace{-0.5em}
  {\em #1} \hfill {\em #2}
  \smallskip
  \begin{itemize}{}{\leftmargin=5.5mm} % \cdot used for bullets, no indentation
    \renewcommand\labelitemi{-}
    \itemsep -0.2em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{itemize}
  \vspace{0.5em} % Some space after the list of bullet points
}