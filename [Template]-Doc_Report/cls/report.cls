% ============================================================
% MIT License

% Copyright (c) 2025 Simon Zuluaga Henao

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
\ProvidesClass{Report}[2025/11/04 Report]
\LoadClass[10pt]{article}    % 215.9 x 279.4

\RequirePackage[margin=2.54cm]{geometry}
\RequirePackage[style=apa]{biblatex}
\RequirePackage{csquotes}       % Error handling
\RequirePackage{lipsum,xcolor,setspace,fancyhdr,titlesec,hyperref,subcaption,tikz,adjustbox,graphicx,float}

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
\setlength{\headheight}{14.00943pt}

\renewcommand{\UrlFont}{\ttfamily\small}
% \renewcommand\ttdefault{ttfamily}





% ============================== CANNOT BE MODIFIED ==============================
\titleformat{\section}{\Large}{
    \begin{tikzpicture}[overlay]
        \node[fill=colorBlack!7, minimum width=\textwidth, minimum height=0.7cm] at (8cm, 0.15cm) {};
    \end{tikzpicture} \bfseries\thesection.\ }{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsection}{\large}{\bfseries\thesubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsubsection}{\bfseries}{\thesubsubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}

\defbibheading{bibliography}[\refname]{
  \section*{\bfseries#1{{\color{colorBlack!25}\hrule}}\vspace{-1cm}}
}

% ==================================================

\renewcommand{\maketitle}[1]{
    \begin{center}
        {\LARGE\bfseries\docTitle}
        \vspace{2mm}\\
        \docAuthors
        {\color{colorBlack!85}
        \begin{spacing}{0.9}
            \docContract\\
            \docRevision\\
        \end{spacing}
        }
    \end{center}
    \vspace{4mm}
    {\small \textbf{#1}\docObject}
    \vspace{4mm}{\color{colorBlack!25}\hrule}
}

\newcommand{\makesignature}[2]{
    \null
    \vspace*{2.5cm}
    {\color{colorBlack!15}\rule{0.5\textwidth}{0.5mm}}\\
    {{\color{colorBlack}{\bfseries#1}\\
    {\color{colorBlack!75}#2}}}
}

\newcommand{\makesignatures}[4]{
    \begin{minipage}[t]{0.48\textwidth}
        \null
        \vspace*{2.5cm}
        {\color{colorBlack!25}\rule{0.75\textwidth}{0.5mm}}\\
        {{\color{colorBlack}{\bfseries#1}\\
        {\color{colorBlack!75}#2}}}
    \end{minipage}\hfill
    \begin{minipage}[t]{0.48\textwidth}
        \null
        \vspace*{2.5cm}
        {\color{colorBlack!25}\rule{0.75\textwidth}{0.5mm}}\\
        {{\color{colorBlack}{\bfseries#3}\\
        {\color{colorBlack!75}#4}}}
    \end{minipage}
}

% ==================================================

\fancypagestyle{report}{
    \renewcommand{\headrulewidth}{0pt}
    
    \lhead{
        \begin{tikzpicture}[remember picture,overlay]
            \node[xshift=-74mm,yshift=-5mm,anchor=north] at (current page.north)
            {\begin{adjustbox}{}
                \includegraphics[width=20mm]{logos/logo.pdf}
            \end{adjustbox}};
        \end{tikzpicture}
    }
    \rhead{
        {\colorbox{colorBlack!75}{\makebox[0.25\textwidth][r]{\color{colorBlack!5}\bfseries\docContract}}}
    }
    \chead{}
    \lfoot{\color{colorBlack!50}\small \docRevision}
    \rfoot{\color{colorBlack!50}\small\thepage}
    \cfoot{}
}

% ==================================================

\AtBeginDocument{
    \onehalfspacing
    \pagestyle{report}
}

% ============================================================

\ProcessOptions\relax