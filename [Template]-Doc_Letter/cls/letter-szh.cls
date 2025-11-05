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
\ProvidesClass{DocLetter}[2025/11/01 DocLetter]
\LoadClass[10pt]{article}    % 215.9 x 279.4

\RequirePackage[margin=3cm,headsep=2.54cm,footskip=2.54cm,includefoot,includehead]{geometry}
\RequirePackage[colorlinks=true,urlcolor=colorLightBlue]{hyperref}
\RequirePackage{lipsum,fontawesome5,fancyhdr,xcolor,tikz,adjustbox,xifthen}

% ========== Fonts ==========
% ===== SERIF FONTS =====
% \RequirePackage{libertinus}
% \RequirePackage{tgheros}
% \RequirePackage{libertine}
% \RequirePackage{ebgaramond-maths}
% \RequirePackage[default,light]{sourceserifpro}

% ===== SANS SERIF FONTS =====
% \RequirePackage[sfdefault,light]{josefin}
% \RequirePackage{cmbright}
% \RequirePackage[sfdefault,light]{roboto}
% \RequirePackage[default]{cantarell}
\RequirePackage[light]{iwona}
% \RequirePackage[default]{raleway}
% \RequirePackage[default]{gillius}
% \RequirePackage[familydefault,light]{Chivo}
% \RequirePackage[default]{sourcesanspro}
% \RequirePackage[defaultfam,extralight]{montserrat}



% ============================== CAN BE MODIFIED ==============================
\definecolor{colorBlack}{HTML}{262626}
\definecolor{colorGray}{HTML}{737373}
\definecolor{colorLine}{HTML}{262626}

\linespread{1.125}
\setlength\parindent{0pt}
\setlength{\parskip}{2mm}
\setlength{\headheight}{33.38657pt}
\renewcommand{\headrulewidth}{0pt}





% ============================== CANNOT BE MODIFIED ==============================

\renewcommand{\maketitle}{
    \begin{flushleft}
        {\bfseries\letterRName}\\
        \letterRCharge\\
        \letterRCity
    \end{flushleft}
    \vspace*{10mm}
    
    \begin{flushright}
        {\color{colorGray}\letterDate}
    \end{flushright}
    {\large\color{colorBlack!75}{\bfseries\letterTitle}}
    \vspace*{7.5mm}
}


\newcommand{\makesignature}[2]{
    \null
    \vspace*{2.5cm}
    {\color{colorGray!15}\rule{0.5\textwidth}{0.5mm}}\\
    {\ifthenelse{\isempty{#1}}
        {{\color{colorBlack!75}\bfseries\letterSName\ \letterSLastName}\\
        {\color{colorGray}\letterSCharge}}
        {{\color{colorBlack!75}{\bfseries#1}\\
        {\color{colorGray}#2}}}
    }
}

\newcommand{\makesignatures}[4]{
    \begin{minipage}[t]{0.48\textwidth}
        \null
        \vspace*{2.5cm}
        {\color{colorGray!15}\rule{0.75\textwidth}{0.5mm}}\\
        {{\color{colorBlack!75}{\bfseries#1}\\
        {\color{colorGray}#2}}}
    \end{minipage}\hfill
    \begin{minipage}[t]{0.48\textwidth}
        \null
        \vspace*{2.5cm}
        {\color{colorGray!15}\rule{0.75\textwidth}{0.5mm}}\\
        {{\color{colorBlack!75}{\bfseries#3}\\
        {\color{colorGray}#4}}}
    \end{minipage}
}

% ============================================================

\fancypagestyle{letter}{
    \lhead{}
    \rhead{
        {\LARGE{\color{colorGray}\bfseries\letterSName\ \color{colorGray!50}\letterSLastName}\\
        \vspace{2mm}
        {\normalsize\color{colorGray}\letterSCity}}
    }
    \chead{}
    \lfoot{
        \begin{tikzpicture}[remember picture,overlay]
            \node[xshift=-2mm,anchor=west] at (current page.west)
            {\tikz \fill [colorLine!90] rectangle (4.6mm,1.7\textheight);};
        \end{tikzpicture}
    }
    \rfoot{
        {\small{\color{colorGray!80}\faPhone*~\letterSPhone ~$|$ \faEnvelope~\letterSEmail}}
    }
    \cfoot{}
}

% ============================================================

\AtBeginDocument{
    \pagestyle{letter}
        
    \maketitle
}