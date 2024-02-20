\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template}[2023/05/02 CV Template]
\LoadClass{article}

% Packages
\RequirePackage{changepage}
\RequirePackage{enumitem}
\RequirePackage{fontawesome}
\RequirePackage{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{makecell}
\RequirePackage{paracol}
\RequirePackage{ragged2e}
\RequirePackage{setspace}
\RequirePackage[default]{sourcesanspro}
\RequirePackage{tabularx}
\RequirePackage{titlesec}
\RequirePackage{xcolor}

% Paper size options
\DeclareOption{a4paper}{
  \setlength\paperheight{297mm}
  \setlength\paperwidth{210mm}}
\DeclareOption{a5paper}{
  \setlength\paperheight{210mm}
  \setlength\paperwidth{148mm}}
\DeclareOption{b5paper}{
  \setlength\paperheight{250mm}
  \setlength\paperwidth{176mm}}
\DeclareOption{letterpaper}{
  \setlength\paperheight{11in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{legalpaper}{
  \setlength\paperheight{14in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{executivepaper}{
  \setlength\paperheight{10.5in}
  \setlength\paperwidth{7.25in}}
\DeclareOption{landscape}{
  \setlength\@tempdima{\paperheight}
  \setlength\paperheight{\paperwidth}
  \setlength\paperwidth{\@tempdima}}

% Font size options
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

% Set default options
\ExecuteOptions{a4paper,11pt,final}

% Process given options
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\input{size1\@ptsize.clo}

% Colors
\definecolor{colorconcordia}{HTML}{912338}
\definecolor{colormcgill}{HTML}{EC1B2E}
\definecolor{colorudem}{HTML}{0057AC}
\definecolor{coloruqam}{HTML}{0079BE}

\definecolor{colorsidebar}{HTML}{E6E6E6}
\definecolor{coloraccent}{HTML}{0057AC}

% Lengths
\def \margininfo {5pt}
\def \marginside {20pt}
\def \marginmain {20pt}

% Commands
\newcommand*{\cvname}[1]{\def\@cvname{#1}}
\newcommand*{\cvemail}[1]{\def\@cvemail{#1}}
\newcommand*{\cvphone}[1]{\def\@cvphone{#1}}
\newcommand*{\cvgithub}[1]{\def\@cvgithub{#1}}
\newcommand*{\cvlinkedin}[1]{\def\@cvlinkedin{#1}}

% Structure

\backgroundcolor{c[0](15pt,15pt)}{colorsidebar}
\geometry{
  letterpaper,
  top=15pt,
  bottom=15pt,
  left=15pt,
  right=15pt,
}

% Content commands

\newcommand{\makeprofile}
{
  {
    \Huge
    \vspace*{0pt}
    \@cvname
    \vspace*{5pt}
  }

  \vspace{4pt}
  \begin{itemize}[leftmargin=\margininfo,itemsep=0pt,label={}]
    \item \faEnvelope \hspace{1pt} \@cvemail
    % \item \faPhoneSquare \hspace{1pt} \@cvphone
    \item \href{https://github.com/\@cvgithub}{\faGithub \hspace{1pt} \@cvgithub}
    \item \href{https://linkedin.com/in/\@cvlinkedin}{\faLinkedin \hspace{1pt} \@cvlinkedin}
  \end{itemize}
}

% Component commands

\newcommand*\@myenvname{rightcolumn}

\titleformat{\section}
  {
    \scshape\Large
    \ifx\@currenvir\@myenvname
      \color{coloraccent}
    \fi
  }{}{0pt}{}
  [
    \ifx\@currenvir\@myenvname
      \titlerule
    \fi
  ]

\newcommand*{\introduction}[1]{
  {
    \justifying
    \begin{adjustwidth}{\marginmain}{\marginmain}
      \par #1
    \end{adjustwidth}
  }
}

\newenvironment{interests}
    {\begin{itemize}[leftmargin=\marginside,label={}]}
    {\end{itemize}}

\newenvironment{referees}
    {\begin{itemize}[leftmargin=\marginside,label={}]}
    {\end{itemize}}

\newenvironment{assets}
    {\begin{itemize}[leftmargin=\marginside,label={}]}
    {\end{itemize}}

\newenvironment{programminglanguages}
    {\begin{itemize}[leftmargin=\marginside,label={}]}
    {\end{itemize}}

\newenvironment{naturallanguages}
    {\begin{itemize}[leftmargin=\marginside,label={}]}
    {\end{itemize}}

\newenvironment{projects}
    {\begin{itemize}[leftmargin=\marginmain,rightmargin=\marginmain,label={}]}
    {\end{itemize}}

\newenvironment{degrees}
    {\begin{itemize}[leftmargin=\marginmain,rightmargin=\marginmain,label={}]}
    {\end{itemize}}

\newenvironment{publications}
    {\begin{itemize}[leftmargin=\marginmain,rightmargin=\marginmain,label={}]}
    {\end{itemize}}

\newenvironment{skills}
	{\begin{itemize}[leftmargin=\marginmain,rightmargin=\marginmain,label={}]}
	{\end{itemize}}

\newenvironment{jobs}
    {\begin{itemize}[leftmargin=\marginmain,rightmargin=\marginmain,label={}]}
    {\end{itemize}}

\newenvironment{infos}
  {\tabularx{\linewidth}{>{\raggedleft\bfseries}p{80pt}X}}
  {\endtabularx}

\newcommand*{\interest}[1]{\item #1}

\newcommand*{\asset}[1]{\item #1}

\newcommand*{\referee}[2]{\item #1 \\ {\small #2}}

\newcommand*{\programminglanguage}[2]{\item \textbf{#1} \\ #2}

\newcommand*{\naturallanguage}[2]{\item \textbf{#1} \\ #2}

\newcommand{\project}[3]{\item \href{#2}{\textbf{#1 \hspace{1pt} {\small \faExternalLink}}} \\ #3}

\newcommand{\degree}[4]{\item \textbf{#1} \hfill {\small #2} \\ #3 \\ \vspace{5pt} {\small #4}}

\newcommand{\publication}[2]{\item \textit{``#1''} \\ {\small #2}}

\newcommand{\job}[4]{\item \textbf{#1} \hfill {\small #2} \\ #3 \\ \vspace{5pt} {\small #4}}

\newcommand{\skill}[2]{\item {\small \textbf{#1} \\ #2}}

\newcommand{\info}[2]{#1 & \makecell[Xt]{#2} \\}

% Structure commands

\AtBeginDocument{
  \pagestyle{empty}
  \thispagestyle{empty}
  \setlength{\columnsep}{30pt}
  \columnratio{0.3,0.7}
  \raggedright
  \begin{paracol}{2}
  \begin{leftcolumn}
}

\newcommand{\switch}{
  \end{leftcolumn}
  \vfill
  \newpage
  \switchcolumn
  \begin{rightcolumn}
  \vspace*{-20pt}
}

\AtEndDocument{
  \end{rightcolumn}
  \end{paracol}
}
