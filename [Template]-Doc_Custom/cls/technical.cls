% ============================================================
% MIT License

% Copyright (c) 2025 Simon Zuluaga Henao

% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Technical}[2025/05/18 Technical]
\LoadClass[10pt]{article}    % 215.9 x 279.4
% \LoadClass[10pt,twocolumn]{article}    % 215.9 x 279.4

\RequirePackage[margin=2.5cm]{geometry}
\setlength{\headheight}{14.8pt}
\RequirePackage[style=apa]{biblatex}
\RequirePackage{csquotes}       % Error handling
\RequirePackage[table]{xcolor}
\RequirePackage{lipsum,setspace,fancyhdr,titlesec,subcaption,lastpage,tikz,tocloft,hyperref,multicol,enumitem}

% ========== Fonts ==========
% ===== SERIF FONTS =====
\RequirePackage{libertinus}
% \RequirePackage{tgheros}
% \RequirePackage{libertine}
% \RequirePackage{ebgaramond}
% \RequirePackage{tgcursor}
% \RequirePackage{lmodern}
% \RequirePackage[default,light]{sourceserifpro}

% \renewcommand*{\familydefault}{\sfdefault}	% use the sans-serif font
\renewcommand*{\familydefault}{\rmdefault}       % Switch back to default (serif) font
\def\mathfamilydefault{\rmdefault}              % but keep the serif font for formulas

\addbibresource{mybib.bib}



% ============================== CAN BE MODIFIED ==============================
\definecolor{colorBlack}{HTML}{363636}
\colorlet{colorCaption}{colorBlack!80}
\colorlet{colorLightCaption}{colorBlack!60}


\DeclareCaptionFormat{captionColor}{
    {\color{colorCaption}\bfseries{#1#2}}{\small #3}
}
\captionsetup{format=captionColor}

% ========== Spacing ========== %
\newcommand{\@sectionsSpacing}{-4mm}
\newcommand{\@tagSize}{2.5cm}

\setlength\parindent{0pt}
\setlength{\parskip}{2mm}
\setlength{\columnsep}{0.8cm}
\setlist[itemize]{itemsep=1pt}
\setlist[enumerate]{itemsep=1pt}





% ============================== CANNOT BE MODIFIED ==============================
\renewcommand{\cftsubsecfont}{\color{colorCaption}\bfseries}
\renewcommand{\cftsubsubsecfont}{\color{colorCaption}\bfseries}
\renewcommand{\cftsubsecpagefont}{\color{colorCaption}}
\renewcommand{\cftsubsubsecpagefont}{\color{colorCaption}}

\renewcommand{\UrlFont}{\ttfamily\small}
% \renewcommand\ttdefault{ttfamily}

% ==================================================

\titleformat{\section}{\Large\bfseries}{\thesection\quad}{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsection}{\large\bfseries}{\thesubsection\quad}{0pt}{\vspace{\@sectionsSpacing}}
\titleformat{\subsubsection}{\bfseries}{\thesubsubsection\quad}{0pt}{\vspace{\@sectionsSpacing}}

% ==================================================

% It's recommended to use a height of 0.5cm per line of text
\newcommand{\highlight}[2]{
    \newline
    \tikz[baseline]{
        \hspace{1cm}
        \node[fill=colorCaption, anchor=west, minimum width=2mm, minimum height=#1] (T){};
        \node[align=left, anchor=west, xshift=4mm, text width=\linewidth-1.4cm] at (T.west){#2};
    }
}

\renewcommand{\maketitle}{
    \vspace{-0.5cm}
    {\linespread{0.8}\selectfont
    \parbox{\textwidth}{\huge\bfseries\MakeUppercase{\docTitle}}}\\
    \onehalfspacing
    {
        \color{colorCaption}
        \vspace{-1mm}\\
        \headrule
        \vspace{-1mm}\\
        {\large\itshape\docType}\\
        {
            {
                \vfill
                \docAuthor
                \vspace{0.4cm}\\
                {\footnotesize\itshape\docAuthorID}
            }
            \vfill
            {\large\docDate}
        }
    }
    \clearpage
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
    \cfoot{\color{colorLightCaption}\thepage\ $/$\ \pageref*{LastPage}}
}

\fancypagestyle{doc}{
    \renewcommand{\headrule}{
        \vspace{-2mm}%
        \hbox to\headwidth{%
        \color{colorLightCaption}\leaders\hrule height \headrulewidth\hfill}
    }
    
    \lhead{}
    \rhead{}
    \chead{\color{colorLightCaption}\docTitle}
    \lfoot{}
    \rfoot{}
    \cfoot{\color{colorLightCaption}\thepage\ $/$\ \pageref*{LastPage}}
}

% ==================================================

\AtBeginDocument{
    \onehalfspacing

    \thispagestyle{front}
    \addtocontents{toc}{\protect\thispagestyle{tocStyle}}
    \pagestyle{doc}
}