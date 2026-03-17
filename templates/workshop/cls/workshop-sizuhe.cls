% ============================================================
% MIT License

% Copyright (c) 2026 Simon Zuluaga Henao

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Workshop}[2026/03/17 Workshop]
\LoadClass[10pt]{article}    % 215.9 x 279.4

\RequirePackage[margin=2.54cm]{geometry}
\RequirePackage[style=apa]{biblatex}
\RequirePackage{csquotes}       % Error handling
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{lipsum,xcolor,setspace,fancyhdr,titlesec,hyperref,subcaption,float}

% ========== Fonts ==========
\RequirePackage[light]{iwona}

\addbibresource{mybib.bib}



% ============================== CAN BE MODIFIED ==============================
\definecolor{colorBlack}{HTML}{262626}

\DeclareCaptionFormat{captionColor}{
    {\bfseries{#1#2}}{\small #3}
}
\captionsetup{format=captionColor}


% ========== Spacing ========== %
\newcommand{\@sectionsSpacing}{-4mm}

\setlength\parindent{0pt}
\setlength{\parskip}{2mm}
\setlength{\columnsep}{0.8cm}

\renewcommand{\UrlFont}{\ttfamily\small}
% \renewcommand\ttdefault{ttfamily}





% ============================== CANNOT BE MODIFIED ==============================
\titleformat{\section}{\Large}{\bfseries\thesection.\ }{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsection}{\large}{\bfseries\thesubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsubsection}{\bfseries}{\thesubsubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}

\defbibheading{bibliography}[\refname]{
  \section*{\bfseries#1{{\color{colorBlack!25}\hrule}}\vspace{-1cm}}
}

% ==================================================

\newcommand{\question}[2]{
    \vspace{1cm}
    \begin{mdframed}[
            backgroundcolor=colorBlack!7,
            linecolor=colorBlack!30,
            linewidth=.2pt,
            roundcorner=5pt,
        ]
        \textbf{#1}\\
        #2
    \end{mdframed}
}

\renewcommand{\maketitle}[1]{
    \begin{center}
        {\LARGE\bfseries\docTitle}
        \vspace{2mm}\\
        \docAuthors\\
        \vspace{-1mm}
        {\color{colorBlack!85}
        \docEmails\\
        {\small\docDate}
        }
    \end{center}
    \vspace{4mm}
    {\small\textbf{#1}\docObjective}
    \vspace{4mm}{\color{colorBlack!25}\hrule}
}

% ==================================================

\fancypagestyle{workshop}{
    \renewcommand{\headrulewidth}{0pt}
    
    \lhead{}
    \rhead{}
    \chead{}
    \lfoot{\color{colorBlack!50}\small\docTitle}
    \rfoot{\color{colorBlack!50}\small\thepage}
    \cfoot{}
}

% ==================================================

\AtBeginDocument{
    \onehalfspacing
    \pagestyle{workshop}
}

% ============================================================

\ProcessOptions\relax