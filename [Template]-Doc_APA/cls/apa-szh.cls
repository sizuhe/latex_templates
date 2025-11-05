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
\ProvidesClass{DocAPA}[2025/07/08 DocAPA]
\LoadClass[10pt]{article}    % 215.9 x 279.4

\RequirePackage[margin=2.54cm]{geometry}
\RequirePackage[style=apa]{biblatex}
\RequirePackage[letterspace=150]{microtype}
\RequirePackage{csquotes}       % Error handling
\RequirePackage{lipsum,xcolor,setspace,fancyhdr,titlesec,hyperref,subcaption,vwcol,multicol}

% ========== Fonts ==========
% ===== SERIF FONTS =====
% \RequirePackage{libertinus}
% \RequirePackage{tgheros}
% \RequirePackage{libertine}
% \RequirePackage{ebgaramond-maths}
\RequirePackage[default,light]{sourceserifpro}

% ===== SANS SERIF FONTS =====
% \RequirePackage[sfdefault,light]{josefin}
% \RequirePackage{cmbright}
% \RequirePackage[sfdefault,light]{roboto}
% \RequirePackage[default]{cantarell}
% \RequirePackage[light]{iwona}
% \RequirePackage[default]{raleway}
% \RequirePackage[default]{gillius}
% \RequirePackage[familydefault,light]{Chivo}
% \RequirePackage[default]{sourcesanspro}
% \RequirePackage[defaultfam,extralight]{montserrat}

\addbibresource{mybib.bib}



% ============================== CAN BE MODIFIED ==============================
\definecolor{colorBlack}{HTML}{262626}

\DeclareCaptionFormat{captionColor}{
    {\color{colorBlack!75}\bfseries{#1#2}}{\small #3}
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
% ========== APA01 attributes ========== %
\DeclareOption{apa01}{
    \titleformat{\section}{\Large\bfseries}{\thesection.\ }{0pt}{\vspace{\@sectionsSpacing}}
    \titleformat{\subsection}{\large\bfseries}{\thesubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}
    \titleformat{\subsubsection}{\bfseries}{\thesubsubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}

    % ==================================================
    
    \renewcommand{\maketitle}{
        {\LARGE\bfseries\docTitle}
        \vspace{2mm}\\
        {\large\docAuthor}
        \vspace{-4mm}\\
        {\color{colorBlack!85}
            {\small
            \begin{spacing}{0.9}
                \docEmail\\
                \docInstitution\\
                \docDate
            \end{spacing}
            
            \vspace{6mm}
            
            \begin{spacing}{1}
                \docAbstract
            \end{spacing}
    
            \vspace{2mm}
    
            \textit{{\bfseries{Keywords:}} \docKeywords.}
            }
        }
        \vspace{4mm}{\color{colorBlack!20}\hrule}
    }

    % ==================================================

    \fancypagestyle{front}{
        \renewcommand{\headrulewidth}{0pt}
        
        \lhead{}
        \rhead{}
        \chead{}
        \lfoot{}
        \rfoot{\color{colorBlack!60}\thepage}
        \cfoot{}
    }

    \fancypagestyle{apa01}{
        \renewcommand{\headrule}{
            \vspace{-2mm}%
            \hbox to\headwidth{%
            \color{colorBlack!20}\leaders\hrule height \headrulewidth\hfill}
        }
        
        \lhead{\color{colorBlack!70}\small\bfseries\docTitle}
        \rhead{\color{colorBlack!60}\small\docCourse}
        \chead{}
        \lfoot{}
        \rfoot{\color{colorBlack!60}\thepage}
        \cfoot{}
    }

    % ==================================================

    \AtBeginDocument{
        \onehalfspacing
        
        \thispagestyle{front}
        \pagestyle{apa01}
        
        \maketitle
        \vspace{4mm}
    }
}


% ============================================================
% ========== APA02 attributes ========== %
\DeclareOption{apa02}{
    \titleformat{\section}{\large\bfseries}{\thesection.\ }{0pt}{\vspace{\@sectionsSpacing}}
    \titleformat{\subsection}{\bfseries}{\thesubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}
    \titleformat{\subsubsection}{\bfseries}{\thesubsubsection.\ }{0pt}{\vspace{\@sectionsSpacing}}

    % ==================================================
    
    \renewcommand{\maketitle}{
        {\LARGE\bfseries\docTitle}
        \vspace{2mm}\\
        {\large\docAuthor}
        \vspace{-4mm}\\
        {\small
        \begin{spacing}{0.9}
            \docEmail\\
            \docInstitution\\
        \end{spacing}
        }
        
        \vspace{3mm}

        {\color{colorBlack!40}\hrule}\vspace{-.6mm}
        \begin{vwcol}[widths={0.3, 0.7}, sep=1.5cm, rule=0pt, indent=0pt]
            {\lsstyle{DETAILS}}
            {\footnotesize
                \\\vspace{-1.6mm}
                \textcolor{colorBlack!40}{\rule{.3\textwidth}{0.01mm}}
                \\\vspace{1mm}
                \begin{minipage}{.3\textwidth}
                    \textit{Date:}\\
                    \vspace{-0.4mm}
                    \docDate\\
                    \vspace{4mm}
                    \textit{Keywords:}\\
                    \vspace{-0.4mm}
                    \docKeywords
                \end{minipage}
            }

            \newpage

            {\lsstyle{ABSTRACT}}
            {\footnotesize
                \\\vspace{-1.6mm}
                \textcolor{colorBlack!40}{\rule{.635\textwidth}{0.01mm}}
                \\\vspace{1mm}
                \begin{minipage}{.63\textwidth}
                    \docAbstract
                \end{minipage}
            }
        \end{vwcol}
        \vspace{-5mm}{\color{colorBlack!40}\hrule}
    }

    % ==================================================

    \fancypagestyle{apa02}{
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0.1pt}
        \renewcommand{\footrule}{
            \color{colorBlack!20}
            \hrulefill
        }
        
        \lhead{}
        \rhead{\color{colorBlack!60}\thepage}
        \chead{}
        \lfoot{\color{colorBlack!70}\small\bfseries{\docTitle}}
        \rfoot{\color{colorBlack!60}\small\docCourse}
        \cfoot{}
    }

    % ==================================================

    \AtBeginDocument{
        % \onehalfspacing

        \pagestyle{apa02}
        \maketitle
        \vspace{4mm}
    }
}

% ============================================================

\ProcessOptions\relax