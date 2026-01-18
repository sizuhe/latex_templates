% ============================================================
% MIT License

% Copyright (c) 2026 Simon Zuluaga Henao.

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
\ProvidesClass{CV}[2026/01/17 CV]
\LoadClass[10pt]{article}    % 215.9 x 279.4

\RequirePackage[margin=1.5cm]{geometry}
\RequirePackage{lipsum,xcolor,tabularx,enumitem,setspace,hyperref,fancyhdr,multicol,tikz,adjustbox,letterspace,fontawesome5,xifthen,hyperref,graphicx,float,hyphenat}

% ========== Fonts ==========
% ===== SERIF FONTS =====
% \RequirePackage{libertinus}
% \RequirePackage{tgheros}
% \RequirePackage{libertine}
% \RequirePackage{ebgaramond-maths}
% \RequirePackage[default,light]{sourceserifpro}

% ===== SANS SERIF FONTS =====
\RequirePackage[sfdefault,light]{josefin}
% \RequirePackage{cmbright}
% \RequirePackage[sfdefault,light]{roboto}
% \RequirePackage[default]{cantarell}
% \RequirePackage[light]{iwona}
% \RequirePackage[default]{raleway}
% \RequirePackage[default]{gillius}
% \RequirePackage[familydefault,light]{Chivo}
% \RequirePackage[default]{sourcesanspro}
% \RequirePackage[defaultfam,extralight]{montserrat}



% ============================== CAN BE MODIFIED ==============================
\definecolor{colorBlack}{HTML}{262626}

\newcommand{\setcolor}[1]{{\color{colorBlack!80}#1}}
\newcommand{\addindent}{\hspace*{4mm}}

\setlength\parindent{0pt}

\hyphenpenalty=10000
\exhyphenpenalty=10000





% ============================== CANNOT BE MODIFIED ==============================
% ========== Shared attributes ========== %
\renewcommand{\maketitle}[8]{
    \newcommand{\nameFirst}{#3}
    \newcommand{\nameLast}{#4}
    \newcommand{\nameTitle}{#5}

    \ifnum#1=0
        \begin{center}
            {\Huge #3\ \color{colorBlack!45}#4}\\
            #5\\
            \vspace{3mm}
            {\small\color{colorBlack!65}#6}
            \vspace{4mm}
            \begin{spacing}{1}
                #7%
            \end{spacing}
        \end{center}
        \vspace{-6mm}
    \else
        \ifnum#1=1
            \begin{minipage}[b]{0.73\textwidth}
                {\Huge #3\ \color{colorBlack!45}#4}\\
                #5\\
                \vspace{-2mm}\\
                {\small\color{colorBlack!65}#6}
                \vspace{4mm}
                \begin{spacing}{1}
                    #7%
                \end{spacing}
            \end{minipage}
            \hspace{0.04\textwidth}%
            #8%
            \vspace{-2.5mm}
        \else
            {\Huge #3\ \color{colorBlack!45}#4}\\
            #5\\
            \vspace{-2mm}\\
            {\small\color{colorBlack!65}#6}
            \vspace{4mm}
            \begin{spacing}{1}
                #7%
            \end{spacing}
            \vspace{1mm}
        \fi
    \fi

    
    \ifnum#2=1
        \makebox[\linewidth]{\color{colorBlack!20}\rule{\paperwidth}{0.01mm}}
        \vspace{-3mm}
    \else
        \vspace{8mm} 
    \fi
}

\newcommand{\addPersonal}[5]{
    \ifthenelse{\isempty{#1}}{}{\faIcon{envelope} \href{mailto:#1}{#1}\; }
    \ifthenelse{\isempty{#2}}{}{\faIcon{phone-alt} #2\; }
    \ifthenelse{\isempty{#3}}{}{\faIcon{fingerprint} #3\; }
    \ifthenelse{\isempty{#4}}{}{\faIcon{map-marker-alt} #4\; }
    \ifthenelse{\isempty{#5}}{}{\\#5}
}

\newcommand{\addNetwork}[2]{
    \ifthenelse{\equal{#1}{linkedin}}{\faIcon{#1} \href{https://www.#1.com/in/#2/}{#2}}{\faIcon{#1} \href{https://www.#1.com/#2/}{#2}}
}

\newcommand{\addPicture}[2]{
    \begin{tikzpicture}[remember picture,overlay]
        \node[xshift=-(\the\dimexpr\oddsidemargin+1in\relax)+#2,yshift=-17mm,anchor=north east] at (current page.north east)
        {\begin{adjustbox}{bgcolor=white}
            #1%
        \end{adjustbox}};
    \end{tikzpicture}
}


% ============================================================
% ========== CV01 attributes ========== %
\DeclareOption{cv01}{
    \setlist{topsep=-1mm,itemsep=-1mm,label={\color{colorBlack!80}$\cdot$},before=\small}

    % ==================================================
    
    \newcommand{\cvSection}[1]{
        \begin{center}
            {\color{colorBlack!80}\large\bfseries#1}
        \end{center}
        \vspace{-5mm}
        {\color{colorBlack!80}\rule{\textwidth}{0.01mm}}
    }

    \newcommand{\cvSubSection}[1]{
        \begin{center}
            \begin{tabularx}{\textwidth}{@{}
                    >{\hsize=1\hsize\raggedright\arraybackslash}X
                @{}}
                \mbox{\color{colorBlack!80}\bfseries #1}
            \end{tabularx}
        \end{center}
        \vspace{-7mm}
    }

    \newcommand{\addSectionContent}[4]{
        \vspace{-6mm}
        \begin{center}
            \begin{tabularx}{\textwidth}{@{}
                    >{\hsize=0.7\hsize\raggedright\arraybackslash}X
                    >{\hsize=0.3\hsize\raggedleft\arraybackslash}X
                @{}}
                \mbox{\color{colorBlack!80}#1} & \mbox{\small\color{colorBlack!80}#2}
            \end{tabularx}
            \begin{tabularx}{\textwidth}{@{}
                    >{\hsize=0.7\hsize\raggedright\arraybackslash}X
                    >{\hsize=0.3\hsize\raggedleft\arraybackslash}X
                @{}}
                \mbox{\color{colorBlack!80}{\bfseries#3}} & \mbox{\small\color{colorBlack!80}#4}
            \end{tabularx}
        \end{center}
    }

    \newcommand{\addSubSectionContent}[2]{
        \vspace{-6mm}
        \begin{center}
            \begin{tabularx}{\textwidth}{@{}
                    >{\hsize=1\hsize\raggedright\arraybackslash}X
                @{}}
                \mbox{{\color{colorBlack!80}{\bfseries#1:}}\ \small{#2}}
            \end{tabularx}
        \end{center}
        \vspace{-4mm}
    }

    \newcommand{\addContentSpace}{
        \null\vspace{2mm}
    }
    \newcommand{\addSpace}{
        \vspace{2mm}
    }

    % ==================================================
    
    \protect\thispagestyle{empty}
}


% ============================================================
% ========== CV02 attributes ========== %
\DeclareOption{cv02}{
    \setlist{topsep=.5mm,itemsep=-1mm,label={\color{colorBlack!80}$\cdot$},before=\small}

    % ==================================================

    \newcommand{\content}[2]{
        \begin{minipage}[t]{0.33\textwidth}
            #1
        \end{minipage}
        \hspace{0.03\textwidth}%
        \begin{minipage}[t]{0.63\textwidth}
            #2
        \end{minipage}
    }

    \newcommand{\cvSection}[2]{
        \ifnum#1=1
            \vspace{0mm}
        \else
            \vspace{8mm}
        \fi
        {\Large\color{colorBlack!60}\MakeUppercase{\textls[50]{#2}}}\\
        \vspace{-3mm}\\
    }

    \newcommand{\cvTitle}[1]{
        {\large\color{colorBlack!80}\bfseries#1}\vspace{.5mm}\\
    }

    \newcommand{\cvInfo}[2]{
        {#1
        \ifthenelse{\isempty{#2}}{\\\vspace{-4mm}}{$|$ \color{colorBlack!65}\textit{#2}}}\\
    }

    \newcommand{\cvDates}[1]{
        {\small\color{colorBlack!65}#1}\\
    }

    \newcommand{\addSectionContent}[4]{
        \cvTitle{#1}
        \cvInfo{#2}{#3}
        \cvDates{#4}
        \vspace{-4mm}
    }

    \newcommand{\addSubSectionContent}[2]{
        \cvTitle{#1}
        \vspace{-5mm}\\
        {\small#2}
    }

    \newcommand{\addSectionDescription}[1]{
        \\{\small#1}
    }

    \newcommand{\addDescription}[1]{
        {\small#1}
    }

    \newcommand{\addSpace}{
        \vspace{3mm}
    }

    \newcommand{\afterpage}{
        \newgeometry{margin=1.5cm, left=8.3cm}
    }

    % ==================================================
    
    \fancypagestyle{morePages}{
        \fancyhf{}          % Clear header/footer

        \renewcommand{\footrule}{
          {\color{colorBlack!45}
          \hrule width\headwidth height\footrulewidth}
        }
    
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0.2pt}
     
        \fancyhead[R]{\parbox[b]{2cm}{\vspace*{1cm}\raggedleft\color{colorBlack!45}{\thepage}}}
        \fancyfoot[L]{\raisebox{1.5cm}{\nameFirst\ \color{colorBlack!45}\nameLast}}
        \fancyfoot[R]{\raisebox{1.5cm}{\color{colorBlack!45}\nameTitle}}
    }

    % ==================================================
    
    \protect\thispagestyle{empty}
    \pagestyle{morePages}
}

% ============================================================

\ProcessOptions\relax