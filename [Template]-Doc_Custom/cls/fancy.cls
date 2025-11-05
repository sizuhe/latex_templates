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

% ----- USE WITH LUALATEX -----
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Fancy}[2025/04/19 Fancy]
\LoadClass[10pt]{article}    % 215.9 x 279.4

\RequirePackage[margin=2.54cm]{geometry}
\setlength{\headheight}{14.8pt}
\RequirePackage[style=apa]{biblatex}
\RequirePackage{csquotes}       % Error handling
\RequirePackage[table]{xcolor}
\RequirePackage[colorlinks=true, linktoc=all, citecolor=., linkcolor=., urlcolor=colorLightBlack]{hyperref}
\RequirePackage{lipsum,setspace,fancyhdr,titlesec,subcaption,afterpage,lastpage,tikz,tocloft}

% ========== Fonts ==========
\RequirePackage{fontspec, lmodern}
\newfontfamily\gilroy{Gilroy}[
    Path = fonts/fancy/,
    Extension = .otf,
    UprightFont = *-Light,
    BoldFont = *-SemiBold,
    ItalicFont = *-LightItalic
]
\newfontfamily\baxter{BaxterSans}[
    Path = fonts/fancy/,
    Extension = .otf,
    UprightFont=*-Regular,
    ItalicFont=*-RegularItalic,
    BoldFont=*-SemiBold
]
\renewcommand{\familydefault}{\sfdefault}	% use the sans-serif font
\def\mathfamilydefault{\rmdefault}          % but keep the serif font for formulas

\addbibresource{mybib.bib}



% ============================== CAN BE MODIFIED ==============================
% colorFront is the main color to get to colorTag and colorRef through complementary separation.
\definecolor{colorBlack}{HTML}{363636}
\definecolor{colorWhite}{HTML}{F7F7F7}
\definecolor{colorFront}{HTML}{275669}
\definecolor{colorTag}{HTML}{BE7046}
\definecolor{colorRef}{HTML}{5289DC}
\colorlet{colorLightBlack}{colorBlack!60}
\colorlet{colorLightWhite}{colorWhite!80!gray}
\colorlet{colorVLightBlack}{colorBlack!25}
\colorlet{colorLightRef}{colorRef!25}

\DeclareCaptionFormat{captionColor}{
    {\color{colorRef}\bfseries{#1#2}}{\small #3}
}
\captionsetup{format=captionColor}

% ========== Spacing ========== %
\newcommand{\@sectionsSpacing}{-4mm}
\newcommand{\@tagSize}{2.5cm}

\setlength\parindent{0pt}
\setlength{\parskip}{2mm}
\setlength{\columnsep}{0.8cm}





% ============================== CANNOT BE MODIFIED ==============================
\renewcommand{\cfttoctitlefont}{\color{colorTag}\huge\bfseries}
\renewcommand{\cftsecfont}{\color{colorTag}\bfseries}
\renewcommand{\cftsecpagefont}{\color{colorTag}\bfseries}
\renewcommand{\cftsubsecpagefont}{\color{colorBlack}}
\renewcommand{\cftsubsubsecpagefont}{\color{colorBlack}}

\renewcommand{\UrlFont}{\ttfamily\small}
% \renewcommand\ttdefault{ttfamily}

% ==================================================

\titleformat{\section}{\color{colorTag}\Large\bfseries}{\thesection\quad}{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsection}{\color{colorTag}\large\bfseries}{\thesubsection\quad}{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsubsection}{\color{colorTag}\bfseries}{\thesubsubsection\quad}{0pt}{\vspace{\@sectionsSpacing}}

% ==================================================

\newcommand{\doctag}[2]{
    \begin{center}
        \begin{tikzpicture}[overlay]
            \node[fill=colorTag, text=white, minimum width=\@tagSize, minimum height=\@tagSize+1cm, align=center, text height=\@tagSize] at (7.5cm, \@tagSize-1.2cm)
            {\Large\gilroy\bfseries{#1}\\
            \normalsize{\gilroy\bfseries{Num. #2}}};
        \end{tikzpicture}
    \end{center}
}

% It's recommended to use a height of 0.5cm per line of text
\newcommand{\highlight}[2]{
    \newline
    \tikz[baseline]{
        \hspace{1cm}
        \node[fill=colorLightRef, anchor=west, minimum width=2mm, minimum height=#1] (T){};
        \node[align=left, anchor=west, xshift=4mm, text width=\linewidth-1.4cm] at (T.west){#2};
    }
}

\renewcommand{\maketitle}{
    \pagecolor{colorFront}
    \afterpage{\nopagecolor}
    
    \baxter
    {\color{colorWhite}
        {\vspace{3cm}
        {\fontsize{57}{60}\bfseries\MakeUppercase{\docTitle}}
        \vspace{-2mm}\\
        {\color{colorLightWhite}
            {\Large\docSubTitle}
            \vspace{12cm}\\
            {\large\docAuthor}
            \vspace{0.4cm}\\
            {\itshape\docAuthorID}}
        }
    }
    \clearpage
    \gilroy
}

% ==================================================

\fancypagestyle{front}{
    \renewcommand{\headrulewidth}{0pt}

    \lhead{}
    \rhead{}
    \chead{}
    \lfoot{}
    \rfoot{}
    \cfoot{}
}

\fancypagestyle{tocStyle}{
    \renewcommand{\headrulewidth}{0pt}

    \lhead{}
    \rhead{}
    \chead{}
    \lfoot{}
    \rfoot{}
    \cfoot{\baxter\color{colorLightBlack}\thepage\ $/$\ \pageref*{LastPage}}
}

\fancypagestyle{doc}{
    \renewcommand{\headrule}{
        \vspace{-2mm}%
        \hbox to\headwidth{%
        \color{colorVLightBlack}\leaders\hrule height \headrulewidth\hfill}
    }
    
    \lhead{}
    \rhead{}
    \chead{\baxter\color{colorLightBlack}\docTitle}
    \lfoot{}
    \rfoot{}
    \cfoot{\baxter\color{colorLightBlack}\thepage\ $/$\ \pageref*{LastPage}}
}

% ==================================================

\AtBeginDocument{
    \onehalfspacing

    \thispagestyle{front}
    \addtocontents{toc}{\protect\thispagestyle{tocStyle}}
    \pagestyle{doc}
    \gilroy         % If maketitle not used
}