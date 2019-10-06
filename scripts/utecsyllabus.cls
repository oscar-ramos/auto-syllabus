%%
%%% utecsyllabus.sty
%%% Package for creating a syllabus at utec 
%%
%% Created by Oscar Ramos (oramos@utec.edu.pe)
%%

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{utecsyllabus}[2017/10/02 v1.0 Syllabus LaTeX class]
\LoadClass[11pt,a4,oneside]{article}

\RequirePackage[a4paper, top=3.8cm, bottom=2.5cm, left=3cm, right=3cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish, es-noindentfirst]{babel}
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{xparse}

\DeclareOption{spanish}{%
  \newcommand*{\CoordinatorStr}{Coordinador}
  \newcommand*{\CoordinatorInstructorStr}{Coordinador e instructor}
  \newcommand*{\InstructorStr}{Instructor}
  \newcommand*{\InstructorsStr}{Instructores}
  \newcommand*{\CourseSyllabusStr}{Sílabo del Curso -- Período }
}
\DeclareOption{english}{%
  \newcommand*{\CoordinatorStr}{Coordinator}
  \newcommand*{\CoordinatorInstructorStr}{Coordinator and instructor}
  \newcommand*{\InstructorStr}{Instructor}
  \newcommand*{\InstructorsStr}{Instructors}
  \newcommand*{\CourseSyllabusStr}{Course Syllabus -- Period }
}
\ProcessOptions\relax

\pagestyle{fancy}
\cfoot{}
\rhead{\begin{picture}(500,0)
    \put(6,0){\includegraphics[width=3.9cm]{utec}} \end{picture}}

\decimalpoint


\def\term#1{\def\@term{#1}}
\renewcommand{\maketitle}{%
\begingroup  
\begin{center}
  \textbf{\large{Universidad de Ingeniería y Tecnología}}\\[11pt]
  \textbf{\large{\CourseSyllabusStr \@term}}
  \end{center}
\endgroup
}

\DeclareTextFontCommand{\textbfit}{%
  \fontseries\bfdefault %
  \itshape }

\NewDocumentCommand{\mainEntry}{m g}
{\IfNoValueTF{#2} {\textbfit{#1}} {\textbfit{#1} {#2}}}

\NewDocumentCommand{\courseCodeName}{m g}
{{\textbfit{Código del curso y nombre:} {#1}}}

\NewDocumentCommand{\credits}{m g}
{{\textbfit{Créditos:} {#1}}}

\NewDocumentCommand{\hours}{m g}
{{\textbfit{Horas por sesión (teoría y laboratorio):} {#1}}}

\newcommand{\courseCoordinator}[3]
{{\textbfit{Nombre del coordinador e instructores, e-mail y horario de atención:}

 \coordinator{#1}{#2}{#3}}
}


\NewDocumentCommand{\submainEntry}{m g}
{\IfNoValueTF{#2} {\textbfit{#1}} {\textbfit{#1} {#2}}}

\RequirePackage{xifthen}
\newcommand{\bookEntry}[6]{%
\ifthenelse{\equal{#6}{}}
{#1, \textit{#2}, {#4}: {#3}, {#5}.}
{#1, \textit{#2}, {#6}, {#4}: {#3}, {#5}.}
}

\newcommand{\coordinatorInstructor}[3]{%
  \vspace{6pt} \CoordinatorInstructorStr: \\ {#1} \hfill {#2} \\ {#3}
}

\newcommand{\coordinator}[3]{%
  \vspace{6pt} \CoordinatorStr: \\ {#1} \hfill {#2} \\ {#3}
}

\newcommand{\instructor}[3]{%
  \vspace{6pt} \InstructorStr: \\ {#1} \hfill {#2} \\ {#3}
}

\NewDocumentCommand{\instr}{m g g}
{\IfNoValueTF{#3} { {#1} \hfill {#2}} {{#1} \hfill {#2} \\ {#3}}}

\newcommand{\methodology}[2]{ \vspace{3pt} \textbf{#1} \\ {#2} \vspace{3pt} }

\newenvironment{mainEnumerate}{
\begin{enumerate}[label=\textbf{\arabic*}., leftmargin=*]
  \setlength\itemsep{8pt} }{ \end{enumerate} }

\newenvironment{submainEnumerate}{
  \begin{enumerate}[label=\textbf{\textit{\alph*}}., leftmargin=0.5cm]
  \setlength\itemsep{6pt} }{ \end{enumerate} }

\newenvironment{topicsEnumerate} {
  \begin{enumerate}[label=\arabic*.] }{ \end{enumerate} }

\newenvironment{metEnumerate}{
  \begin{enumerate}[label*=\textbf{\textit{\arabic*}}., leftmargin=0.3cm]
  }{ \end{enumerate} }

\newenvironment{bibItemize}{
  \begin{itemize}[label={-}, leftmargin=0.4cm] }{ \end{itemize} }

\newenvironment{subItemize}{
  \begin{itemize}[label={-}, leftmargin=0.4cm] }{ \end{itemize} }

\newenvironment{instructors}{
  \vspace{6pt} \InstructorsStr: \vspace{-6pt}
  \begin{itemize}[label={-}, leftmargin=0.4cm] }{ \end{itemize} }
