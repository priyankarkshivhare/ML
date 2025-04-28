\ProvidesClass{notestyle}[2025/04/15 Custom Artile Style]

% Load base class
\LoadClass[12pt]{article}

% Required packages
\RequirePackage[a4paper,margin=1.1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{eso-pic} % for absolute positioning on page
\RequirePackage{etoolbox}
\RequirePackage[parfill]{parskip}
\RequirePackage{multicol}
\RequirePackage{hyperref}
\RequirePackage{tabularx}

% Load xcolor with named and custom colors
\RequirePackage[x11names]{xcolor}

% Define custom colors
\definecolor{documentblue}{HTML}{283592}
\definecolor{documentpink}{HTML}{E01B84}

% Define metadata macros
\newcommand{\companyname}[1]{\def\@companyname{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\documentimage}[1]{\def\@documentimage{#1}}

% Set sensible defaults
\def\@companyname{}
\def\@tagline{}
\def\@title{}
\def\@author{}
\def\@documentimage{}

% Page style
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[c]{\textcolor{documentpink}{\thepage}}

% Title setup
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  {\LARGE\bfseries \textcolor{documentblue}{\@companyname} \par}
  \vspace{0.2em}
  {\normalsize\itshape \@tagline \par}
  
  \vspace{1.5em}
  {\raggedright\Huge\bfseries \textcolor{documentblue}{\@title} \par}
  \vspace{0.2em}
  {\normalsize \textcolor{documentpink}{\@author} \par}
  
  \vspace{0.2em}
  \IfFileExists{\@documentimage}{
    \includegraphics[width=\textwidth]{\@documentimage}
  }{
    % Fallback if image doesn't exist
    \rule{0.35\textwidth}{0.2\textwidth}
  }

  \vfill
  \clearpage
}


% Add image overlays on every page
\AddToShipoutPictureBG{%
  \begin{tikzpicture}[remember picture, overlay]
    \ifnum\value{page}=1
      % Top-right corner
      \node[anchor=north east, inner sep=0pt] at (current page.north east) {\includegraphics{../Template/title-right.png}};
    \else
      % Top-right corner
      \node[anchor=north east, inner sep=0pt] at (current page.north east) {\includegraphics{../Template/header-right.png}};
    \fi
    % Bottom-left corner
    \node[anchor=south west, inner sep=0pt] at (current page.south west) {\includegraphics[width=\paperwidth]{../Template/footer.png}};
  \end{tikzpicture}%
}

% End of class
