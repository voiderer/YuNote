\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{YuNote}[2017/02/27 v1.00 Yu note document class]

\RequirePackage{color,xcolor}

\newcommand*{\base}[1]{
 \def\@base{\includegraphics[scale=0.3]{#1}
 }
}

\DeclareOption{green}{
   \definecolor{main}{RGB}{210,168,75}
   \definecolor{seco}{RGB}{9,80,3}
   \definecolor{thid}{RGB}{0,175,152}
	\base{greenbase.pdf}
}

\DeclareOption{cyan}{
   \definecolor{main}{RGB}{239,126,30}
   \definecolor{seco}{RGB}{0,175,152}
   \definecolor{thid}{RGB}{236,74,53}
   \base{cyanbase.pdf}
}

\DeclareOption{blue}{
   \definecolor{main}{RGB}{127,191,51}
   \definecolor{seco}{RGB}{0,145,215}
   \definecolor{thid}{RGB}{180,27,131}
   \base{bluebase}
}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{book}%
}

\ExecuteOptions{green}

\ProcessOptions\relax

\LoadClass[12pt,a4paper,openany]{book}

\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
\RequirePackage{booktabs}
\linespread{1.3}
%%判断参数是否为空
\RequirePackage{xifthen}
%%图片路径设置
\RequirePackage{graphicx}

\graphicspath{{./figure/}{./figures/}{./image/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

%%页面大小
\RequirePackage{geometry}
\geometry{
    a4paper,
   left=17mm,  %% or inner=23mm
   right=17mm, %% or outer=18mm
   top=15.4mm, bottom=15.4mm,
   headheight=2.17cm,
   headsep=4mm,
   footskip=12mm
}

%%设置英文字体
\RequirePackage{fontenc}
\RequirePackage[no-math,cm-default]{fontspec}
\defaultfontfeatures{Mapping=tex-text} 
\RequirePackage{xunicode}
\RequirePackage{xltxtra} 
\setmainfont[Ligatures=TeX]{Minion Pro} %  (\textrm)
\setsansfont{Myriad Pro} %  (\textsf)
\setmonofont{Adobe Garamond Pro}%Palatino Linotype

%-中文字体设置-%
\RequirePackage{xeCJK}
\setCJKmainfont[BoldFont={Adobe 黑体 Std},ItalicFont={Adobe 楷体 Std}]{华文中宋}%方正书宋_GBK Adobe Song Std L
\setCJKsansfont[BoldFont={Adobe 黑体 Std}]{Adobe 仿宋 Std}
\setCJKmonofont{腾祥铚谦钢笔繁}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

\setCJKfamilyfont{new}{Adobe 仿宋 Std}
%%   章节设置
\RequirePackage[center]{titlesec}
\renewcommand{\chaptername}{第 \thechapter 章}

\titleformat{\chapter}[display]{\normalfont}
{\bfseries\filcenter\LARGE\enspace \color{seco}\chaptername\enspace}{1pt}{\color{seco}\LARGE\bfseries\filcenter}[\@base]

\titleformat{\section}[block]{\sffamily}
{\hspace{-1.45em}\Large\bfseries{\color{seco}\thesection}\enspace}{1pt}{\color{seco}\Large\bfseries\filright}

\titleformat{\subsection}[block]{\sffamily}
{\large\bfseries\color{seco}\thesubsection\enspace}{1pt}{\color{seco}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{0pt}{1.5\baselineskip}

%%中文结构名字
\renewcommand{\contentsname}{\bfseries 目\hspace{2em}录}
\renewcommand{\figurename}{\textbf{图}}
\renewcommand{\tablename}{\text{表}}
\renewcommand{\partname}{部分}
\renewcommand{\listfigurename}{\bfseries 插图目录}
\renewcommand{\listtablename}{\bfseries 表格目录}
\renewcommand{\bibname}{\bfseries 参考文献}
\renewcommand{\appendixname}{\bfseries 附\hspace{2em}录}
\renewcommand{\indexname}{\bfseries 索\hspace{2em}引}
%%页眉页脚的设置
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\fancyhf{}
\fancyhead[EL,OR]{\color{seco}--\thepage/\pageref{LastPage}--}
\fancyhead[ER]{\color{seco}\em\nouppercase\leftmark{}}
\fancyhead[OL]{\color{seco}\em\nouppercase\rightmark}
\fancyfoot[c]{\@base}
\renewcommand{\headrule}{\color{seco}\hrule width\textwidth}
\pagestyle{fancy}

\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\; #1}{} }
\renewcommand{\chaptermark}[1]{\markboth{\chaptername \; #1\;}{}}


\newcommand*{\stressA}[1]{{\color{main}#1}}
\newcommand*{\stressB}[1]{{\color{seco}#1}}
\newcommand*{\trans}[2]{{\color{main}#1\color{thid}(#2)}}

\definecolor{bule}{RGB}{18,29,57}
\definecolor{bablue}{RGB}{248,248,248}
\definecolor{pale}{RGB}{200,200,200}


         
         
\RequirePackage{environ}

\RequirePackage{tikz}
\usetikzlibrary{shapes,decorations}

\tikzstyle{newthemsty} 
          =[draw=main, fill=blue!10,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{newthemstytitle}
          =[fill=seco, text=blue!10]

\tikzstyle{newdefinitionsty} 
          =[draw=main, fill=yellow!20,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt,
           text=black,fill opacity=0.9]
\tikzstyle{newdefinitionstytitle} 
         =[fill=main, text=white]
         
\tikzstyle{newpropositionsty} 
          =[draw=thid, fill=bablue,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt,
           text=black,fill opacity=0.9]
\tikzstyle{newpropositionstytitle} 
         =[fill=thid, text=white]
         
\tikzstyle{newequationsty} 
          =[draw=seco!20, fill=seco!5,thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=10pt]
           
\tikzstyle{newequationstytitle} 
         =[fill=pale!10, text=black]
         
\tikzstyle{newtrasnlationsty} 
          =[draw=seco, fill=seco!10,thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=10pt]

\NewEnviron{newpara}[1][{}]{%
\noindent\centering
\begin{tikzpicture}
\node[newtrasnlationsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\BODY
     \end{minipage}};
\end{tikzpicture}
}[\par\vspace{.3\baselineskip}]

\RenewEnviron{equation}[1][{}]{%
\noindent\centering
\begin{tikzpicture}
\node[newequationsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \centering\[\BODY\]
     \end{minipage}};
\node[newequationstytitle,left=2] at (box.east){
     \bf\textsf{ \stepcounter{equation}(\theequation)}};

 \ifthenelse{\isempty{#1}}%
    {}% if #1 is empty
    {\node[newdefinitionstytitle, right=10pt] at (box.north west) {\bf\textsf{#1}};}% if #1 is not empty

\end{tikzpicture}
}[\par\vspace{.3\baselineskip}]

%%define the note and newproof environment
\RequirePackage{pifont,manfnt}
\newenvironment{note}{\par\ttfamily\itshape\noindent{\makebox[0pt][r]{\scriptsize\color{red!90}\textdbend\quad}\textbf{Note:}}}{\par\vspace{.5\baselineskip}}

\newenvironment{example}{\par\noindent\textbf{Example: }\color{black!90}}{\par\vspace{.5\baselineskip}}

\newenvironment{assumption}{\par\noindent\textbf{Assumptions: }\color{black!90}}{\par\vspace{.5\baselineskip}}

\newenvironment{conclusion}{\par\noindent\textbf{Conclusions: }\color{black!90}}{\par\vspace{.5\baselineskip}}

\newenvironment{newproof}{\par\noindent{\makebox[0pt][r]{\color{seco}\ding{43}\;\;}\textbf{Proof:}}\color{black!90}\small}{\hfill$\Box$\quad\par\vspace{.5\baselineskip}}

\RequirePackage{enumitem}
\setlength{\itemsep}{1pt}

\renewcommand{\labelitemi}{$\diamond$}
\renewcommand{\labelitemii}{$\checkmark$}
\renewcommand{\labelitemiii}{$\times$}
\renewcommand{\labelitemiv}{$\bullet$}