%%%
%%% brccms-hu.cls for (u)pLaTeX2e+LuaTeX
%%   for the Bulletin of Research Center for Computing and Multimedia Studies,
%%   Hosei University
%%     by Motoaki Sato (ULS and Company), 2022
%%     E-mail: teppei@uls.co.jp, http://www.uls.co.jp/
\ifx\directlua\@undefined
 \NeedsTeXFormat{pLaTeX2e}
\else
 \NeedsTeXFormat{LaTeX2e}
\fi
\ProvidesClass{brccms-hu}
  [2022/02/03 v1.0 法政大学情報メディア教育研究センター研究報告]

\def\rccms@warning{\ClassWarningNoLine{brccms-hu}}
\def\rccmsline@warning{\ClassWarning{brccms-hu}}

\newif\if@enable@uptex \@enable@uptexfalse
\ifx\directlua\@undefined
 \def\kenc@rccms{JY2}
 \ifx\kenc@rccms\cy@encoding
  \@enable@uptextrue
 \fi
 %%
 %\def\zw{zw}%
 %\def\zh{zh}%
 \def\rccms@kanjiskip#1{\kanjiskip#1}
 \def\rccms@xkanjiskip#1{\xkanjiskip#1}% for kintou
\else
 \@enable@uptextrue
 \RequirePackage{luatexja}%
 %\RequirePackage{luatexja-fontspec}
 \def\rccms@kanjiskip#1{\ltjsetparameter{kanjiskip=#1}}
 \def\rccms@xkanjiskip#1{\ltjsetparameter{xkanjiskip=#1}}% for kintou
\fi

\newif\if@Proof \@Prooffalse
\DeclareOption{Proof}{\@Prooftrue}

\newif\if@english \@englishfalse
\DeclareOption{english}{\@englishtrue}

\newcounter{@paper}
%\newif\if@landscape \@landscapefalse
\newcommand{\@ptsize}{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse

\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@stysize \@stysizefalse
\newif\if@enablejfam \@enablejfamtrue
\newif\if@mathrmmc \@mathrmmcfalse
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a4p}{\setcounter{@paper}{1}\@stysizetrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
%\DeclareOption{landscape}{\@landscapetrue
%  \setlength\@tempdima{\paperheight}%
%  \setlength\paperheight{\paperwidth}%
%  \setlength\paperwidth{\@tempdima}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{%
     \jobname\space(\number\year-\two@digits\month-\two@digits\day
     \space\two@digits\hour:\two@digits\minute)}%
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1\p@}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{\z@}%
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{mathrmmc}{\@mathrmmctrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\ExecuteOptions{a4paper,10pt,twoside,twocolumn,final}
\ProcessOptions\relax

%%% 和文フォントは後回し
\edef\kenc@JYn{\cy@encoding}
\edef\kenc@JTn{\ct@encoding}%\typeout{!!! \kenc@JTn}% 2012 OK

\def\Cjascale{1}% 0.924714

\ifx\directlua\@undefined
 \if@enable@uptex
  \DeclareFontShape{JY2}{mc}{m}{n}{%
    <-> s * [1] upjisr-h
  }{}
  \DeclareFontShape{JY2}{gt}{m}{n}{% 
    <-> s * [1] upjisg-h
  }{}
  \DeclareFontShape{JT2}{mc}{m}{n}{%
    <-> s * [1] upjisr-v
  }{}
  \DeclareFontShape{JT2}{gt}{m}{n}{% 
    <-> s * [1] upjisg-v
  }{}
 \else
  %% ?pt (実際の大きさ)  (実際の大きさ x 1.0392687)
  \DeclareFontShape{JY1}{mc}{m}{n}{%
    <-> s * [1.0392687] jis
  }{}
  \DeclareFontShape{JY1}{gt}{m}{n}{%
    <-> s * [1.0392687] jisg
  }{}
  \DeclareFontShape{JT1}{mc}{m}{n}{%
    <-> s * [1.0392687] jis-v
  }{}
  \DeclareFontShape{JT1}{gt}{m}{n}{%
    <-> s * [1.0392687] jisg-v
  }{}
 \fi
\else
\DeclareFontShape{JY3}{mc}{m}{n}{%
  <-> s*[1]\ltj@stdmcfont:jfm=ujis
}{}
\DeclareFontShape{JY3}{gt}{m}{n}{%
  <->s*[1]\ltj@stdgtfont:jfm=ujis
}{}
%%%
\DeclareFontShape{JT3}{mc}{m}{n}{%
  <-> s*[1]\ltj@stdmcfont:jfm=ujisv
}{}
\DeclareFontShape{JT3}{gt}{m}{n}{%
  <->s*[1]\ltj@stdgtfont:jfm=ujisv
}{}
\fi

\DeclareFontShape{\kenc@JYn}{mc}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{gt}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{b}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{b}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{m}{sl}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JYn}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{gt}{m}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{bx}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{b}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{b}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{gt}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{b}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{b}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{m}{sl}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JTn}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{gt}{m}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{bx}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{b}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{b}{sl}{<->ssub*gt/m/n}{}
\ifx\directlua\@undefined\else
\renewcommand\jttdefault{\gtdefault}\@ltj@match@familytrue
\fi

\ifx\directlua\@undefined
 \def\@setfontsize#1#2#3{\@nomath#1%
  \ifx\protect\@typeset@protect
    \let\@currsize#1%
  \fi
  \fontsize{#2}{#3}\selectfont
  \kanjiskip=0zw \@plus .1zw \@minus .025zw
  \xkanjiskip=0.25em \@plus 0.15em \@minus 0.06em
 }%
\else
 \def\@setfontsize#1#2#3{%
 %\@nomath#1%
  \ifx\protect\@typeset@protect
    \let\@currsize#1%
  \fi
  \fontsize{#2}{#3}\selectfont
  %\ifdim\parindent>\z@
  %  \parindent10\p@
  %\fi
  \ltj@setpar@global
  \ltjsetkanjiskip\z@ plus .1\zw minus .01\zw
  \@tempskipa=\ltjgetparameter{xkanjiskip}
  \ifdim\@tempskipa>\z@
   %\if@slide
   % \ltjsetxkanjiskip .1em
   %\else
    \ltjsetxkanjiskip .25em plus .15em minus .06em
   %\fi
  \fi}
\fi

% <jsize10.clo>
\renewcommand{\normalsize}{%
 \@setfontsize\normalsize\@xpt{5.25mm}% 21H (5.315mm->just)
 \abovedisplayskip.5\Cvs \@plus.25\Cvs \@minus.15\Cvs
 \abovedisplayshortskip\z@ \@plus.15\Cvs
 \belowdisplayshortskip.3\Cvs \@plus.15\Cvs \@minus.1\Cvs
 \belowdisplayskip \abovedisplayskip
 \let\@listi\@listI}
\normalsize
\ifx\MakeRobust\@undefined \else
  \MakeRobust\normalsize
\fi
\setbox0\hbox{\char\jis"3441}% "
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}
\setbox0=\box\voidb@x

\DeclareRobustCommand{\small}{%
 \@setfontsize\small\@ixpt{3.75mm}% 15H
 \abovedisplayskip.5\baselineskip
   \@plus.25\baselineskip \@minus.15\baselineskip
 \abovedisplayshortskip\z@ \@plus.15\baselineskip
 \belowdisplayshortskip.3\baselineskip
  \@plus.15\baselineskip \@minus.1\baselineskip
 \belowdisplayskip \abovedisplayskip
 \def\@listi{\leftmargin\leftmargini
             \topsep 4\p@ \@plus2\p@ \@minus2\p@
             \parsep 2\p@ \@plus\p@ \@minus\p@
             \itemsep \parsep}%
 \belowdisplayskip \abovedisplayskip}

\DeclareRobustCommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viiipt{9.5}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\DeclareRobustCommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@viiipt}
\DeclareRobustCommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
\DeclareRobustCommand{\large}{\@setfontsize\large\@xiipt{17}}
\DeclareRobustCommand{\Large}{\@setfontsize\Large\@xivpt{21}}
\DeclareRobustCommand{\LARGE}{\@setfontsize\LARGE\@xviipt{25}}
\DeclareRobustCommand{\huge}{\@setfontsize\huge\@xxpt{28}}
\DeclareRobustCommand{\Huge}{\@setfontsize\Huge\@xxvpt{33}}

\headheight\z@
\headsep\z@
\topskip 1\Cht
\footskip14.7mm
\maxdepth .5\topskip
\textwidth160mm % ja eng 同じ 210-(25x2)
%\@settopoint\textwidth
\textheight 44\Cvs % 45行
\advance \textheight \topskip
\advance \textheight .05mm % 頁トップに ()/ などが来ると一行はみ出すことがある
%% 210x297
\topmargin30mm
\advance \topmargin -1in
%\@settopoint\topmargin
\oddsidemargin25mm
\advance \oddsidemargin -1in
%\@settopoint\oddsidemargin
\evensidemargin\oddsidemargin
%\@settopoint\evensidemargin

\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
%\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
%\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
%\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
%\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
%\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\floatsep 1\Cvs \@plus 2\p@ \@minus 2\p@
\dblfloatsep 1\Cvs \@plus 2\p@ \@minus 2\p@
\textfloatsep 1.33\Cvs \@plus 2\p@ \@minus 4\p@
\dbltextfloatsep 1.33\Cvs \@plus 2\p@ \@minus 4\p@
\intextsep 1.33\Cvs \@plus 2\p@ \@minus 2\p@

\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
  \parsep 4\p@ \@plus2\p@ \@minus\p@
  \topsep 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep  4\p@ \@plus2\p@ \@minus\p@
   \parsep  2\p@ \@plus\p@  \@minus\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep 2\p@  \@plus\p@\@minus\p@
   \parsep\z@
   \partopsep \p@ \@plus\z@ \@minus\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%% <jsize10.clo>

\setlength\columnsep{7.4mm}
\setlength\columnseprule{0\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{}
%\setlength\parskip{0\p@ \@plus \p@}
\parskip\z@
\if@english
 \setlength\parindent{5mm}% 20H
\else
 \setlength\parindent{10\p@}
\fi
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{5}% 2
\setcounter{bottomnumber}{4}% 1
\setcounter{totalnumber}{9}% 3
\setcounter{dbltopnumber}{5}% 2
\renewcommand{\topfraction}{.95}% .7
\renewcommand{\bottomfraction}{.95}% .3
\renewcommand{\textfraction}{.05}% .2
\renewcommand{\floatpagefraction}{.05}% .5
\renewcommand{\dbltopfraction}{.95}% .7
\renewcommand{\dblfloatpagefraction}{.05}% .5

\if@Proof
 \def\@Rtop{\rlap{\smash{\rule[-\headsep]{0.05mm}{10mm}%
  \rule[-\headsep]{10mm}{0.05mm}}}}
 \def\@Ltop{\llap{\smash{\rule[-\headsep]{10mm}{0.05mm}%
  \rule[-\headsep]{0.05mm}{10mm}}}}
 \def\@Rbot{\rlap{\smash{\raisebox{1\footskip}%
  {\rule[-10mm]{0.05mm}{10mm}\rule{10mm}{0.05mm}}}}}
 \def\@Lbot{\llap{\smash{\raisebox{1\footskip}%
  {\rule{10mm}{0.05mm}\rule[-10mm]{0.05mm}{10mm}}}}}
\else
 \let\@Rtop\relax\let\@Ltop\relax\let\@Rbot\relax\let\@Lbot\relax
\fi

\def\nombre@font{\normalfont\small}
\def\foot@font{\normalfont\small}

\if@english
 \def\received#1#2#3{\def\@temp@m{#2}\ifx \@temp@m\@empty\def\@temp@m{0}\fi
  \def\@recmonth{%
   \ifcase\@temp@m Xxx\or Jan.\or Feb.\or March\or April\or 
    May\or June\or July\or Aug.\or Sep.\or Oct.\or Nov.\or Dec.\fi}%
  \xdef\@received{Received\ \ignorespaces #3\unskip\ \@recmonth\ 
   \ignorespaces #1\unskip}%
 }
 \def\@received{Received XX Xxx 20XX}%
 \def\published#1#2#3{\def\@temp@m{#2}\ifx \@temp@m\@empty\def\@temp@m{0}\fi
  \def\@pubmonth{%
   \ifcase\@temp@m Xxx\or Jan.\or Feb.\or March\or April\or 
    May\or June\or July\or Aug.\or Sep.\or Oct.\or Nov.\or Dec.\fi}%
  \xdef\@published{Published online\ \ignorespaces #3\unskip\ \@pubmonth\ 
   \ignorespaces #1\unskip}}
 \def\@published{Published online XX Xxx 20XX}
\else
 \def\received#1#2#3{%
  \gdef\@received{原稿受付\hskip4.5\p@\ignorespaces #1\unskip 年%
   \ignorespaces #2\unskip 月%
   \ignorespaces #3\unskip 日}}
 \def\@received{原稿受付\hskip4.5\p@ 20XX年XX月XX日}
 \def\published#1#2#3{%
  \gdef\@published{発行\hskip22.5\p@\ignorespaces #1\unskip 年%
   \ignorespaces #2\unskip 月%
   \ignorespaces #3\unskip 日}}
 \def\@published{発行\hskip22.5\p@ 20XX年XX月XX日}
\fi

\def\RPC@info{\smash{\lower11.5mm\hbox to \z@{%
 \small
 \shortstack[l]{%
  \@received\\
  \@published\\
  Copyright \copyright\ \@Year\ Hosei University
 }\hss}}}
\def\foot@rccms{{\small Copyright \copyright\ \@Year\ Hosei University}}%
\if@english
 \def\FPhead@rccms{\smash{\raise8.5mm\hbox{%
  \small
  \ifodd\c@page
   \def\LorR{r}%
  \else
   \def\LorR{l}%
  \fi
  \expandafter\shortstack\expandafter[\LorR]{Bulletin of Research Center
    for Computing and Multimedia Studies,\\[-.25mm]
    Hosei University, \@Vol\ (\@Year)}}}}
 \def\head@rccms{\smash{\raise7.5mm\hbox{\small 
  Hosei University, 
  Bulletin of Research Center for Computing and Multimedia Studies Vol.\@Vol}}}%
\else
 \def\FPhead@rccms{\smash{\raise11.5mm\hbox{%
  \small
  法政大学情報メディア教育研究センター研究報告\hskip9\p@
  Vol.\@Vol\hskip13.5\p@ \@Year 年}}}
 \def\head@rccms{\smash{\raise7.5mm\hbox{%
  \small
  法政大学情報メディア教育研究センター研究報告\hskip4.5\p@ Vol.\@Vol}}}%
\fi

\def\ps@FPrccms{%\let\ps@jpl@in\ps@footnombre for title page
 \def\@evenhead{\@Ltop\FPhead@rccms\hfil\@Rtop}%
 \def\@oddhead{\@Ltop\hfil\FPhead@rccms\@Rtop}%
 \def\@evenfoot{\@Lbot\RPC@info
  %%\hskip9\p@{\nombre@font\thepage}%
  \hfil\@Rbot}%
 \def\@oddfoot{\@Lbot\RPC@info\hfil
  {\nombre@font\thepage}\hskip9\p@
 \@Rbot}%
 %\let\@mkboth\markboth 
}

\def\ps@bothstyle{%
 \def\@evenhead{\@Ltop\head@rccms\hfil\@Rtop}%
 \def\@oddhead{\@Ltop\hfil\head@rccms\@Rtop}%
 \def\@evenfoot{%
  \@Lbot\hskip9\p@{\nombre@font\thepage}\hfil\foot@rccms\hskip9\p@\@Rbot}%
 \def\@oddfoot{%
  \@Lbot\hskip9\p@\foot@rccms\hfil{\nombre@font\thepage}\hskip9\p@\@Rbot}%
 %\let\@mkboth\markboth
}

%\def\p@thanks#1{\footnotemark
%  \protected@xdef\@thanks{\@thanks
%    \protect{\noindent\hbox{\yoko$\m@th^\thefootnote$}#1\protect\par}}}

\def\Vol#1{% Vol.36 = Year 2021
 \def\@tempa{#1}%
 \ifx\@tempa\@empty
  \gdef\@Vol{xx}\gdef\@Year{20XX}%
 \else
  \edef\@tempb{\zap@space#1 \@empty}%
  \afterassignment\remove@to@nnil
   \count@ 0\@tempb\relax\@nnil
  \ifnum\count@=\z@
   \gdef\@Vol{xx}%
  \else
   \@tempcnta=#1\relax
   \advance \@tempcnta 1985\relax
   \xdef\@Year{\the\@tempcnta}%
   \gdef\@Vol{\zap@space#1 \@empty}%
  \fi
 \fi
}
\def\@Vol{XX}%
\def\@Year{20XX}

\def\jtitle#1{\gdef\@jtitle{#1}}
\def\@jtitle{}
\def\jsubtitle#1{\gdef\@jsubtitle{#1}}
\def\@jsubtitle{}
\def\etitle#1{\gdef\@etitle{#1}}
\def\@etitle{}
\def\esubtitle#1{\gdef\@esubtitle{#1}}
\def\@esubtitle{}
\if@english
 \let\title\etitle
 \let\subtitle\esubtitle
\fi

%% author 関係
\newtoks\@authorlist
\newcount\@authorcnt
\newcount\total@nr
\newcount\@alcnt
\newcount\chk@alcnt
%\newbox\@tempboxb
\newbox\@tempboxc

\def\authorlist#1{%
 \if@english
  \let\authorentry\Eauthorentry
 \fi
 \@authorlist={#1}\the\@authorlist\relax
}

\def\save@affi#1{#1}

\def\authorentry#1#2#3{%
 \def\tmp@an{#1}%
 \ifx\tmp@an\@empty
 \else
  \@tempcnta\z@
  \advance \@authorcnt \@ne
  %% author label
  \get@al{#3}%
  \def\al@none{0}%
  %% author's name in Japanese
  \fmt@Jan{#1}% \the\@temptokena
  \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
   \@authorname\unskip\kern\z@\protect\save@affi{\plural@affi}%
  }%
  %% author's name in English
  \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
   %\@authorname
   #2\unskip\kern\z@\protect\save@affi{\plural@affi}%
  }%
  \global\total@nr=\@authorcnt
  \def\@tempcheck{}%
  \def\plural@affi{}%
 \fi
}

\def\Eauthorentry#1#2{%
 \def\tmp@an{#1}%
 \ifx\tmp@an\@empty
 \else
  \@tempcnta\z@
  \advance \@authorcnt \@ne
  %% author label
  \get@al{#2}%
  \def\al@none{0}%
  %% author's name in English
  %\def\tr@name##1 ##2\@nil{##1 {\protect\scshape ##2}}%
  \def\tr@name##1 ##2\@nil{##1 ##2}% v1.0
  \protected@edef\@authorname{\expandafter\tr@name #1\@nil\null}%
  \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
   \@authorname\unskip\kern\z@\protect\save@affi{\plural@affi}%
  }%
  \global\total@nr=\@authorcnt
  \def\plural@affi{}%
 \fi
}
\def\plural@affi{}

\def\name@expandafter#1#2{%
 \def\next{#1}%
 \edef\@tempa{#2}%
 \ifx\@tempa\@empty
  \rccms@warning{author's name is empty}%
  \def\@tempa{\@empty}%
 \fi
 \expandafter\next\@tempa}
\def\chk@name#1{\name@expandafter\@chk@name{#1}\@nil}
\def\@chk@name#1#2\@nil{\def\get@oneword{#1}}

\def\fmt@Jan#1{%
 \@temptokena{#1}%
 \setbox\@tempboxc\hbox{\spaceskip=100mm #1}%
 \ifdim \wd\@tempboxc < 100mm
  \rccms@warning{Author's name "#1" doesn't have a space}%
  \def\@authorname{\the\@temptokena}%
 \else
  \chk@name{\the\@temptokena}%
  \ifcat\get@oneword ア%
   \protected@xdef\@authorname{\spaceskip=6\p@\hbox{#1}}%
  \else
   \protected@xdef\@authorname{\spaceskip=12\p@\hbox{#1}}%
  \fi
 \fi
}

\def\get@al#1{%
 \def\al@none{none}\def\@tempaffi{#1}%
 \ifx\al@none\@tempaffi\else
  \@for\get@label:=#1\do{%
   \@ifundefined{chk@\get@label}{\global\advance \chk@alcnt \@ne
    \expandafter\gdef\csname chk@\get@label\endcsname{}%
   }{}%
   \expandafter\def\expandafter\save@al\expandafter{%
    \csname al@\get@label\endcsname}%
   \advance \@tempcnta \@ne
   \protected@xdef\plural@affi{\plural@affi
    \ifnum\@tempcnta=\@ne % ((
     $^{\save@al)}$%
    \else
     $^{,\save@al)}$%
    \fi
   }%
  }%
 \fi
}

\def\Jbreakauthorline#1{%
 \@for\@breakauthor:=#1\do{%
  \expandafter\gdef\csname J@breakauthorline\@breakauthor\endcsname{\par}%
 }%
 \@authorcnt\z@
 \loop\ifnum \@authorcnt < \total@nr
  \advance \@authorcnt \@ne
   \@ifundefined{J@breakauthorline\number\@authorcnt}%
    {\expandafter\gdef\csname J@breakauthorline\number\@authorcnt\endcsname
     {\relax}}%
    {}%
 \repeat
}

\def\@outputJauthorlist{%
 \@authorcnt\z@
 \loop\ifnum \@authorcnt < \total@nr
  \advance \@authorcnt \@ne
  \mbox{\csname @Jauthorname\number\@authorcnt\endcsname}\hskip12\p@
  \csname J@breakauthorline\number\@authorcnt\endcsname
 \repeat
}

\def\breakauthorline#1{%
 \@for\@breakauthor:=#1\do{%
  \expandafter\gdef\csname @breakauthorline\@breakauthor\endcsname{\par}%
 }%
 \@authorcnt\z@
 \loop\ifnum \@authorcnt < \total@nr
  \advance \@authorcnt \@ne
   \@ifundefined{@breakauthorline\number\@authorcnt}%
    {\expandafter\gdef\csname @breakauthorline\number\@authorcnt\endcsname
     {\relax}}%
    {\relax}%
 \repeat
}

\newcount\totalnumberm@ne
\def\@outputEauthorlist{%
 \@authorcnt\z@
 \totalnumberm@ne\total@nr \advance \totalnumberm@ne -\@ne
  \loop\ifnum \@authorcnt < \total@nr
   \advance \@authorcnt \@ne 
    \ifnum \@authorcnt < \totalnumberm@ne
     \mbox{\csname @Eauthorname\number\@authorcnt\endcsname}\nobreak, 
      \csname @breakauthorline\number\@authorcnt\endcsname
    \else
     \ifnum \@authorcnt = \total@nr
      \mbox{\csname @Eauthorname\number\@authorcnt\endcsname}
     \else
      \mbox{\csname @Eauthorname\number\@authorcnt\endcsname}\nobreak
       \ifnum \total@nr=\tw@\ \else\ \fi
        \csname @breakauthorline\number\@authorcnt\endcsname
      and\ \nobreak 
     \fi
    \fi
  \repeat
}

\def\Email#1{E-mail:\ \protect\brccms@email{#1}}

\def\affiliate[#1]#2{%
 %\if@english
 % \def\jipcode##1{\ignorespaces ##1\unskip}%
 %\else
 % \def\jipcode##1{〒\hskip0.0625em ##1\hskip3mm\ignorespaces}%
 %\fi
 \advance \@alcnt \@ne
 %\advance \chk@alcnt \@ne
 \@ifundefined{al@#1}%
  {\expandafter\xdef\csname al@#1\endcsname{\the\@alcnt}}{%
   \rccms@warning{Check the "#1" label, it is already asigned}%
  }%
 \protected@xdef\@affiliate{\@affiliate
  \protect\save@affi{%
   \if@english
    $^{\mbox{\scriptsize\itshape % (
     \csname al@#1\endcsname)}}$ %\kern\z@
   \else
    $^{% (
     \csname al@#1\endcsname)}$ %\kern\z@
   \fi
   }#2\\}%
}
\def\@affiliate{}

\newbox\@abstractbox
\newbox\@keywordbox
%\newdimen\@tempdimc

\def\abstract{\global\setbox\@abstractbox=\hbox\bgroup
 \begin{minipage}[t]{406\p@}% \@tempdimc
  \small\baselineskip\Cvs %5.25mm
  {\bfseries Abstract:\ }\ignorespaces}
\def\endabstract{\end{minipage}\egroup}

\def\keyword{\global\setbox\@keywordbox=\hbox\bgroup
 \begin{minipage}[t]{406\p@}% \@tempdimc
  \small\baselineskip\Cvs %5.25mm
  \textit{\bfseries Keywords:\ }\ignorespaces}
\def\endkeyword{\end{minipage}\egroup}


\newcommand{\maketitle}{\par
 \ifnum \chk@alcnt < \@alcnt
  \rccms@warning{label of \string\affiliate\space is not assigned in \string\authorentry}%
 \fi
 \ifnum \chk@alcnt > \@alcnt
  \rccms@warning{information of \string\affiliate\space is not assigned}%
 \fi
 %%
 \ifnum\@alcnt=\@ne
  \let\save@affi\@gobble
 \fi
 %%
 \begingroup
  %\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
  %\def\@makefnmark{\hbox{\ifydir $\m@th^{\@thefnmark}$
  %  \else\hbox{\yoko$\m@th^{\@thefnmark}$}\fi}}%
  %\long\def\@makefntext##1{\parindent 1em\noindent
  %  \hb@xt@1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
  %%
  \twocolumn[\@maketitle]%
  \thispagestyle{FPrccms}%
 \endgroup
 \setcounter{footnote}{0}%
 %\global\let\thanks\relax
 \global\let\maketitle\relax
 \global\let\@maketitle\relax
 %\global\let\p@thanks\relax
 %\global\let\@thanks\@empty
 %\global\let\@author\@empty
 %\global\let\@date\@empty
 \global\let\@jtitle\@empty
 \global\let\jtitle\relax
 \global\let\@jsubtitle\@empty
 \global\let\jsubtitle\relax
 \global\let\@etitle\@empty
 \global\let\etitle\relax
 \global\let\@esubtitle\@empty
 \global\let\esubtitle\relax
 \global\let\@title\@empty
 \global\let\title\relax
 \global\let\@subtitle\@empty
 \global\let\subtitle\relax
 %\global\let\author\relax
 %\global\let\date\relax
 %\global\let\and\relax
}

\def\jtitle@font{\bfseries\fontsize{14}{7.5mm}\selectfont}% 30H
\let\jsubtitle@font\jtitle@font
\def\etitle@font{\bfseries\fontsize{14}{5.75mm}\selectfont}% 23H
\let\esubtitle@font\etitle@font

\def\jauthor@font{\large\baselineskip7mm}% 12pt
\def\eauthor@font{\large}% 12pt

\def\@maketitle{%
 \if@english
 \setbox\@tempboxa\hbox{%
  \begin{minipage}{\textwidth}
   %\vskip\abovejtitlesep
   {\etitle@font\centering
    \leavevmode\ignorespaces\@etitle\par
   }%
   \ifx\@esubtitle\@empty
    \vskip1\Cvs
   \else
    \vskip2.65mm % 33H
    {\esubtitle@font\centering
     \leavevmode\ignorespaces\@esubtitle\par
    }%
    \vskip1\Cvs
   \fi
   %\vskip\aboveeauthorsep
   \vskip2.5mm % 9H
   {\eauthor@font\centering
    \@outputEauthorlist\par
   }%
   \vskip1\Cvs
   %\vskip\aboveacceptancesep
   {\small\itshape\baselineskip\Cvs\centering
    \@affiliate\par
   }%
   \vskip1\Cvs
   %\vskip\aboveabstractsep
   \ifvoid\@abstractbox\else
    \hfil
    \box\@abstractbox\par
    \vskip1.5\Cvs
   \fi
   \ifvoid\@keywordbox\else
    \hfil
    \box\@keywordbox\par
   \fi
  \end{minipage}%
 }%
 \else
 \setbox\@tempboxa\hbox{%
  \begin{minipage}{\textwidth}
   %\vskip\abovejtitlesep
   {\jtitle@font\centering %% \removejfmglue
    \leavevmode\expandafter\inhibitglue\expandafter\ignorespaces
    \@jtitle\par
   }%
   \ifx\@jsubtitle\@empty
    \vskip1.5\Cvs % 52H
   \else
    \vskip.625\Cvs % 42H
    {\jsubtitle@font\centering
     \leavevmode\expandafter\inhibitglue\expandafter\ignorespaces
     \@jsubtitle\par
    }%
    \vskip1.5\Cvs % 52H
   \fi
   {\etitle@font\centering
    \leavevmode\ignorespaces\@etitle\par
   }%
   \ifx\@esubtitle\@empty
    \vskip2\Cvs
   \else
    \vskip2.65mm % 33H
    {\esubtitle@font\centering
     \leavevmode\ignorespaces\@esubtitle\par
    }%
    \vskip2\Cvs
   \fi
   {\jauthor@font\centering
    \@outputJauthorlist\par
   }%
   %\vskip\aboveeauthorsep
   \vskip2.5mm % 9H
   {\eauthor@font\centering
    \@outputEauthorlist\par
   }%
   \vskip1\Cvs
   %\vskip\aboveacceptancesep
   {\small\baselineskip\Cvs\centering
    \@affiliate\par
   }%
   \vskip1\Cvs
   %\vskip\aboveabstractsep
   \ifvoid\@abstractbox\else
    \hfil
    \box\@abstractbox\par
    \vskip1.5\Cvs
   \fi
   \ifvoid\@keywordbox\else
    \hfil
    \box\@keywordbox\par
   \fi
  \end{minipage}%
 }%
 \fi
 \@tempdima\ht\@tempboxa
 \advance \@tempdima \dp\@tempboxa
 \divide \@tempdima \Cvs
 \@tempcnta=\@tempdima
 \advance \@tempcnta \thr@@ %\tw@
 {\newpage\null
  \boxmaxdepth\z@
  \lineskiplimit\z@
  \lineskip\z@
  \parindent\z@
  \vbox to \@tempcnta\Cvs{%
   \leavevmode\box\@tempboxa
  \vss}%
 }\par
 %\vspace{\belowkeywordsep}%
}

\setcounter{secnumdepth}{3}
%\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
%\renewcommand{\thepart}{\@Roman\c@part}
\renewcommand{\thesection}{\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
   \thesubsection.\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{%
   \thesubsubsection.\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{%
   \theparagraph.\@arabic\c@subparagraph}

%% \@startsection{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
\def\@startsection#1#2#3#4#5#6{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
  \if@nobreak
   \everypar{}%
  \else
   %\addpenalty\@secpenalty
   \ifdim\@tempskipa>\z@
    \ifnum#2<4\relax
     \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
     \advance\@tempskipa-2\Cvs
     \vspace{\Cvs}
     \vspace*{\@tempskipa}
    \else
     \addvspace\@tempskipa
    \fi
    %%
   \fi
  \fi
 \@ifstar{\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\if@english
 \def\sectionnum@font{\bfseries}% \fontsize{12\p@}{\z@}\selectfont}
 \def\subsectionnum@font{\normalfont}% \fontsize{10\p@}{\z@}\selectfont}
 \def\dotafter@section{{.}}
 \def\@seccntformat#1{\csname the#1\endcsname\hskip5\p@}
\else
 \def\sectionnum@font{\sffamily}% \fontsize{12\p@}{\z@}\selectfont}
 \def\subsectionnum@font{\sffamily}% \fontsize{10\p@}{\z@}\selectfont}
 \def\dotafter@section{{.}}
 \def\@seccntformat#1{\csname the#1\endcsname\hskip10\p@}
\fi

\newif\if@aftersec\@aftersecfalse

%% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}[ARG1]{ARG2}
%% \ifdim \@tempskipa>\z@ --> \ifdim \@tempskipa<\z@
\def\@sect#1#2#3#4#5#6[#7]#8{%
 \global\@aftersecfalse
 \ifnum #2>\c@secnumdepth
  \let\@svsec\@empty
 \else
  \refstepcounter{#1}%
  \ifnum#2=\@ne
   \protected@edef\@svsec{%
    \csname #1num@font\endcsname\csname the#1\endcsname
    \csname dotafter@#1\endcsname\if@english\hskip5.25\p@\else\hskip10.5\p@\fi}%
   \global\@aftersectrue
  \else
   \ifnum#2=\tw@
    \protected@edef\@svsec{%
     \csname #1num@font\endcsname\csname the#1\endcsname
     \if@english\hskip5\p@\else\hskip10\p@\fi}%
    \global\@aftersectrue
   \else
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
   \fi
  \fi
 \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa<\z@
   \def\@svsechd{%
     #6{\hskip #3\relax
     \@svsec #8}%
    %\csname #1mark\endcsname{#7}%
    %\addcontentsline{toc}{#1}{%
    % \ifnum #2>\c@secnumdepth \else
    %   \protect\numberline{\csname the#1\endcsname}%
    % \fi
    % #7}%
   }%
  \else
   \begingroup
    #6{%
      \@hangfrom{\hskip #3\relax\@svsec}%
       \interlinepenalty \@M #8\@@par
      }%
   \endgroup
   %\csname #1mark\endcsname{#7}%
   %\addcontentsline{toc}{#1}{%
   % \ifnum #2>\c@secnumdepth \else
   %  \protect\numberline{\csname the#1\endcsname}%
   % \fi
   % #7}%
  \fi
  \@xsect{#5}}

%% \@ssect{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}{ARG} ==
%% \ifdim \@tempskipa>\z@ --> \ifdim \@tempskipa<\z@
\def\@ssect#1#2#3#4#5{%
 \@tempskipa #3\relax
 \ifdim \@tempskipa<\z@
  \def\@svsechd{#4{\hskip #1\relax #5}}%
 \else
  \begingroup
    #4{%
      \@hangfrom{\hskip #1}%
      \interlinepenalty \@M #5\@@par}%
  \endgroup
 \fi
 \@xsect{#3}}

%% \ifdim \@tempskipa>\z@ --> \ifdim \@tempskipa<\z@
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa<\z@
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
        \pagebreak[1]% 2-->1
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \else
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \fi
  \ignorespaces}

\def\@afterheading{%
 \if@aftersec\else
  \global\@nobreaktrue
 \fi
 \everypar{%
  \if@nobreak
   \global\@nobreakfalse
   \clubpenalty\z@ % \@M
    \if@afterindent
    \else
     {\setbox\z@=\lastbox}%
    \fi
  \else
   \clubpenalty\@clubpenalty
   \everypar{}%
  \fi}%
}

\if@english
\newcommand{\section}{\@startsection{section}{1}{\z@}%
   {1\Cvs}% \@plus.5\Cvs \@minus.2\Cvs
   {\z@}% \@plus.3\Cvs
   {\bfseries\fontsize{10.5}{1\Cvs}\selectfont}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {1\Cvs}%  \@plus.5\Cvs \@minus.2\Cvs
   {\z@}%  \@plus.3\Cvs
   {\normalfont\normalsize}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {1\Cvs}%  \@plus.5\Cvs \@minus.2\Cvs
   {\z@}%  \@plus.3\Cvs
   {\normalfont\normalsize\itshape}}
\else
\newcommand{\section}{\@startsection{section}{1}{\z@}%
   {1\Cvs}%  \@plus.5\Cvs \@minus.2\Cvs
   {\z@}%  \@plus.3\Cvs
   {\sffamily\gtfamily\fontsize{10.5}{1\Cvs}\selectfont}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {1\Cvs}%  \@plus.5\Cvs \@minus.2\Cvs
   {\z@}%  \@plus.3\Cvs
   {\sffamily\gtfamily\normalsize}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {1\Cvs}%  \@plus.5\Cvs \@minus.2\Cvs
   {\z@}%  \@plus.3\Cvs
   {\normalfont\normalsize}}
\fi
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {1\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {-10\p@}%
   {\normalfont\normalsize\bfseries}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
   {1\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {-10\p@}%
   {\normalfont\normalsize\bfseries}}

\newcommand{\appendix}{\par
 \section*{\appendixname}
 \setcounter{section}{0}%
 \setcounter{subsection}{0}%
 \renewcommand{\thesection}{\@Alph\c@section}%
}

\if@twocolumn
  \setlength\leftmargini {20\p@}
\else
  \setlength\leftmargini {20\p@}
\fi
\setlength\leftmarginii  {20\p@}
\setlength\leftmarginiii {20\p@}
\setlength\leftmarginiv  {20\p@}
\if@twocolumn
  \setlength\leftmarginv {10\p@}
  \setlength\leftmarginvi{10\p@}
\else
  \setlength\leftmarginv {10\p@}
  \setlength\leftmarginvi{10\p@}
\fi
\setlength  \labelsep  {5\p@}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty\z@ % -\@lowpenalty
\@endparpenalty\z@ %   -\@lowpenalty
\@itempenalty\z@ %     -\@lowpenalty

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

\renewenvironment{enumerate}
  {\ifnum \@enumdepth >3\relax\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{% 
   %\expandafter \list \csname label\@enumctr\endcsname{%
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     \settowidth{\labelwidth}{\csname label\@enumctr\endcsname}%
     \labelsep5\p@
     \leftmargin\labelwidth
     \advance\leftmargin \labelsep
     \advance\leftmargin 10\p@
     \listparindent\z@
     \clubpenalty\z@
     \widowpenalty\z@
     \@itempenalty\z@
     \usecounter{\@enumctr}%
     \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

\newcommand{\labelitemi}{\leavevmode\labelitemfont
 \raise.5\p@\hbox to 10\p@{\hss \textbullet\hss}}
\newcommand{\labelitemii}{\leavevmode\labelitemfont
 \raise1.5\p@\hbox to 10\p@{\hss \textendash\hss}}
\newcommand{\labelitemiii}{\leavevmode\labelitemfont
 \raise1.25\p@\hbox to 10\p@{\hss \textasteriskcentered\hss}}
\newcommand{\labelitemiv}{\leavevmode\labelitemfont
 \hbox to 10\p@{\hss ・\hss}}
\newcommand\labelitemfont{\normalfont}

\renewenvironment{itemize}
  {\ifnum \@itemdepth >3\relax\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{% 
   %\expandafter \list \csname \@itemitem\endcsname{%
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     \labelwidth10\p@
     \labelsep\z@
     \leftmargin10\p@
     \advance\leftmargin 10\p@
     \listparindent10\p@
     \clubpenalty\z@
     \widowpenalty\z@
     \@itempenalty\z@
     \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=10\p@ \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}

\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}
\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -1.5em%
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 1.5em}%
           \item\relax}{\endlist}

\newenvironment{quotation}
  {\list{}{%
   \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
   \listparindent10\p@
   \itemindent\listparindent
   \rightmargin\leftmargin
   }%
   \item\relax}{\endlist}
\newenvironment{quote}
  {\list{}{%
   \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
   \rightmargin\leftmargin}%
   \item\relax}{\endlist}

\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\abovecaptionskip.25\Cvs\belowcaptionskip\z@
                \let\center\Center\let\endcenter\endCenter\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\abovecaptionskip\z@\belowcaptionskip.25\Cvs
                \let\center\Center\let\endcenter\endCenter\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

%\newcounter{animation}% v1.0-RC01
%\renewcommand{\theanimation}{\@arabic\c@animation}
%\def\fps@animation{tbp}
%\def\ftype@animation{4}
%\def\ext@animation{lot}
%\def\fnum@animation{\animationname~\theanimation}
%\newenvironment{animation}
%               {\@float{animation}}
%               {\end@float}
%\newenvironment{animation*}
%               {\@dblfloat{animation}}
%               {\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
%\setlength\abovecaptionskip{10\p@}
%\setlength\belowcaptionskip{0\p@}

\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\hskip10\p@ #2}%
  \ifdim \wd\@tempboxa >\hsize
   \centering
   #1\hskip10\p@ #2\relax\par
  \else
   \global \@minipagefalse
   \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}\par
  \fi
  \if@english
   \vskip\belowcaptionskip
  \fi
}

\if@english
 \let\ecaption\@gobble
\else
\def\fnum@Efigure{Fig.\,\thefigure}
\def\fnum@Etable{Table~\thetable}
\long\def\ecaption#1{\par
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
  \@makeEcaption{\csname fnum@E\@captype\endcsname}{\ignorespaces #1}\par
 \endgroup}
\long\def\@makeEcaption#1#2{%
  %\vskip\abovecaptionskip
  \sbox\@tempboxa{#1\hskip10\p@ #2}%
  \ifdim \wd\@tempboxa >\hsize
   \centering
   #1\hskip10\p@ #2\relax\par
  \else
   \global \@minipagefalse
   \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\fi

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand{\theequation}{\@arabic\c@equation}

%\DeclareRobustCommand{\mathmc}{%
%    \@latex@error{Command \noexpand\mathmc invalid with\space
%       `disablejfam' class option.}\@eha
%  }
%  \DeclareRobustCommand{\mathgt}{%
%    \@latex@error{Command \noexpand\mathgt invalid with\space
%       `disablejfam' class option.}\@eha
%}

\ifx\directlua\@undefined
\if@enablejfam
  \if@compatibility\else
    \DeclareSymbolFont{mincho}{\kenc@JYn}{mc}{m}{n}
    \DeclareSymbolFontAlphabet{\mathmc}{mincho}
    \SetSymbolFont{mincho}{bold}{\kenc@JYn}{gt}{m}{n}
    \jfam\symmincho
    \DeclareMathAlphabet{\mathgt}{\kenc@JYn}{gt}{m}{n}
  \fi
  \if@mathrmmc
    \AtBeginDocument{%
    \reDeclareMathAlphabet{\mathrm}{\mathrm}{\mathmc}
    \reDeclareMathAlphabet{\mathbf}{\mathbf}{\mathgt}
  }%
  \fi
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi
\fi

\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

\def\Acknowledgement{%
 \if@english
  \section*{Acknowledgement}
 \else
  \section*{謝辞}
 \fi
}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\newenvironment{thebibliography}[1]
 {\section*{\refname}%\@mkboth{\refname}{\refname}%
   \small\baselineskip\Cvs
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \topsep\z@\parsep\z@\partopsep\z@
         \itemsep\z@ %1.5mm
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty\z@ %4000
   \@clubpenalty\clubpenalty
   \widowpenalty\z@ %4000
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\let\@openbib@code\@empty

\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}

\def\@makefnmark{\smash{\kern\z@
 \hbox{\@textsuperscript{\normalfont \@thefnmark}}\kern\z@}}
\newcommand\@makefntext[1]{\parindent9\p@
  \noindent\hbox to 9\p@{\hss\@makefnmark}#1}

\def\@begintheorem#1#2{%
 \topsep.5\Cvs
 \parsep\z@\partopsep\z@\itemsep\z@
 \labelsep10\p@
 \trivlist
  \item[\hskip \labelsep{\bfseries #1\ #2}]%
  \if@english
   \itshape
  \fi
}%
\def\@opargbegintheorem#1#2#3{%
 \topsep.5\Cvs
 \parsep\z@\partopsep\z@\itemsep\z@
 \labelsep10\p@
 \trivlist
 \if@english
  \item[\hskip \labelsep{\bfseries #1\ #2\ (#3)}]\itshape
 \else
  \item[\hskip \labelsep{\bfseries #1\ #2（#3）\inhibitglue}]%
 \fi
}
\def\@endtheorem{\endtrivlist}

\newif\if西暦 \西暦true
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\newcount\heisei \heisei\year \advance\heisei-1988\relax
\def\pltx@today@year@#1{%
  \ifnum\numexpr\year-#1=1 元\else
    \ifnum1=\iftdir\ifmdir0\else1\fi\else0\fi
      \kansuji\number\numexpr\year-#1\relax
    \else
      \number\numexpr\year-#1\relax\nobreak
    \fi
  \fi 年
}
\def\pltx@today@year{%
  \ifnum\numexpr\year*10000+\month*100+\day<19890108
    昭和\pltx@today@year@{1925}%
  \else\ifnum\numexpr\year*10000+\month*100+\day<20190501
    平成\pltx@today@year@{1988}%
  \else
    令和\pltx@today@year@{2018}%
  \fi\fi}
\def\today{{%
  \if西暦
    \ifnum1=\iftdir\ifmdir0\else1\fi\else0\fi\kansuji\number\year
    \else\number\year\nobreak\fi 年
  \else
    \pltx@today@year
  \fi
  \ifnum1=\iftdir\ifmdir0\else1\fi\else0\fi
    \kansuji\number\month 月
    \kansuji\number\day 日
  \else
    \number\month\nobreak 月
    \number\day\nobreak 日
  \fi}}

%\newcommand{\contentsname}{目 次}
%\newcommand{\listfigurename}{図 目 次}
%\newcommand{\listtablename}{表 目 次}
%\newcommand{\indexname}{索 引}
%\newcommand{\abstractname}{概要}
\if@english
 \newcommand{\figurename}{Fig.\,}
 \newcommand{\tablename}{Table}
 \newcommand{\refname}{REFERENCES}
 \newcommand{\appendixname}{APPENDIX}
 %\newcommand{\animationname}{Animation}% v1.0
\else
 \newcommand{\figurename}{図}
 \newcommand{\tablename}{表}
 \newcommand{\refname}{参考文献}
 \newcommand{\appendixname}{付録}
 %\newcommand{\animationname}{アニメーション}% v1.0
\fi

\ifx\directlua\@undefined
\postbreakpenalty`（=10000
\prebreakpenalty`）=10000
\postbreakpenalty`［=10000
\prebreakpenalty`］=10000
\postbreakpenalty`〈=10000
\prebreakpenalty`〉=10000
\prebreakpenalty`"=10000
\prebreakpenalty`℃=10000
\prebreakpenalty`　=10000
\prebreakpenalty`・=10000
\prebreakpenalty`〜=10000
\prebreakpenalty`ー=10000
\prebreakpenalty`？=10000
\prebreakpenalty`！=10000
\if@enable@uptex
 \postbreakpenalty16=10000
\else
 \postbreakpenalty"5C=10000
\fi
\postbreakpenalty`【=10000
\prebreakpenalty`】=10000
\postbreakpenalty`〔=10000
\prebreakpenalty`〕=10000
\postbreakpenalty`『=10000
\prebreakpenalty`』=10000
\inhibitxspcode`〒=2
\inhibitxspcode`！=1
\else
\ltjsetparameter{prebreakpenalty={`，,10000}}
\ltjsetparameter{prebreakpenalty={`．,10000}}
\ltjsetparameter{prebreakpenalty={`、,10000}}
\ltjsetparameter{prebreakpenalty={`。,10000}}
\ltjsetparameter{prebreakpenalty={`）,10000}}
\ltjsetparameter{prebreakpenalty={`」,10000}}
\ltjsetparameter{prebreakpenalty={`』,10000}}
\ltjsetparameter{prebreakpenalty={`］,10000}}
\ltjsetparameter{prebreakpenalty={`〉,10000}}
\ltjsetparameter{prebreakpenalty={`〕,10000}}
\ltjsetparameter{prebreakpenalty={`】,10000}}
\ltjsetparameter{prebreakpenalty={`〜,10000}}
\ltjsetparameter{prebreakpenalty={`…,10000}}
\ltjsetparameter{prebreakpenalty={`・,10000}}
\ltjsetparameter{prebreakpenalty={`ー,10000}}
\ltjsetparameter{prebreakpenalty={`！,10000}}
\ltjsetparameter{prebreakpenalty={`？,10000}}
\ltjsetparameter{postbreakpenalty={`（,10000}}
\ltjsetparameter{postbreakpenalty={`「,10000}}
\ltjsetparameter{postbreakpenalty={`『,10000}}
\ltjsetparameter{postbreakpenalty={`［,10000}}
\ltjsetparameter{postbreakpenalty={`〈,10000}}
\ltjsetparameter{postbreakpenalty={`〔,10000}}
\ltjsetparameter{postbreakpenalty={`【,10000}}
\ltjsetparameter{jaxspmode={`\{,1}}
\ltjsetparameter{jaxspmode={`\},2}}
\ltjsetparameter{jaxspmode={`!,2}}
\ltjsetparameter{jaxspmode={`〒,1}}
\ltjsetparameter{alxspmode={`+,3}}
\ltjsetparameter{alxspmode={`\%,3}}
\ltjsetparameter{jcharwidowpenalty=500}
\fi

\def\sloppy{\tolerance9999\hbadness9999\hfuzz.5\p@ \vfuzz.5\p@}

\hbadness4000\relax
\vbadness2000\relax % 1000
\tolerance4000\pretolerance\m@ne
\clubpenalty\z@
\widowpenalty\z@

\AtBeginDocument{%
 %%
 \def\qhv@scale{1.05}%
 %% 
 \displaywidowpenalty\z@
 \interdisplaylinepenalty\z@
 \predisplaypenalty\z@
 \postdisplaypenalty\z@
 %% don't use geometry.sty
 \@ifpackageloaded{geometry}{%
  \rccms@warning{Don't use package "geometry"}%
  \def\geometry{Don't use package ``geometry.sty''.}\geometry}{}%
 %% url
 \@ifpackageloaded{url}{%
  \DeclareUrlCommand\brccms@email{\urlstyle{rm}}%
 }{}%
 %% amsthm
 \@ifpackageloaded{amsthm}{%
  %% \thm@preskip=\topsep \thm@postskip=\thm@preskip と定義済み
  %% [] の中のパーレンを全角に/後ろのピリを削除/head の後ろを一字空きに
  \def\@thm#1#2#3{%
    \ifhmode\unskip\unskip\par\fi
    \normalfont
    \trivlist
    \let\thmheadnl\relax
    \let\thm@swap\@gobble
    %\thm@notefont{\fontseries\mddefault\upshape}%
    \thm@notefont{\bfseries}%
    \thm@headpunct{}% add period after heading
    %\thm@headsep 5\p@ plus\p@ minus\p@\relax
    \thm@headsep 10\p@ \@plus 1.5\p@ \@minus 2.5\p@\relax
    %\thm@space@setup
    \thm@preskip=.5\Cvs
    \thm@postskip=\thm@preskip
    #1% style overrides
    \@topsep \thm@preskip               % used by thm head
    \@topsepadd \thm@postskip           % used by \@endparenv
    \def\@tempa{#2}\ifx\@empty\@tempa
      \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
    \else
      \refstepcounter{#2}%
      \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
    \fi
    \@tempa
  }%
  %\def\@endtheorem{\endtrivlist \@doendpe}% \@endpefalse void
  \def\th@plain{% style=plain
   \if@english
    \itshape % body font
   \fi
  }%
  \def\th@remark{% style=remark
   \thm@headfont{\bfseries}%
   \normalfont % body font
   %\thm@preskip\topsep \divide\thm@preskip\tw@
   %\thm@postskip\thm@preskip
  }%
  \def\thmhead@plain#1#2#3{%
    \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
    \thmnote{{\the\thm@notefont
     \if@english
      \ (#3)%
     \else
      （#3）\inhibitglue
     \fi
    }}}%
  \let\thmhead\thmhead@plain
  %% \swapnumbers
  \def\swappedhead#1#2#3{%
    \thmnumber{#2}%
    \thmname{\@ifnotempty{#2}{~}#1}%
    \thmnote{ {\the\thm@notefont （#3）\inhibitglue}}}%
  %% proof
  \if@english
   \def\proofname{\textbf{Proof}}%
  \else
   \def\proofname{\textbf{証明}}%
  \fi
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont
    \labelsep10\p@
    \trivlist
    \item[\hskip\labelsep
          \if@english\itshape\fi
      \textbf{#1\inhibitglue}\@addpunct{}]\ignorespaces
  }{%
    \popQED
    \endtrivlist\@endpefalse
  }%
 }{}%
 %% endnotes.sty
%% \@ifpackageloaded{endnotes}{%
%%  \if@english\else
%%   \def\endnote{\inhibitglue
%%      \@ifnextchar[%]
%%        \@xendnote{\stepcounter{endnote}%
%%        \protected@xdef\@theenmark{\theendnote}%
%%        \@endnotemark\@endnotetext}}%
%%  \fi
%%  \let\footnote\endnote
%%  \def\@makeenmark{%
%%   \smash{\kern\z@\hbox{\@textsuperscript{\normalfont\@theenmark}}\kern\z@}}%
%%  \renewcommand{\notesname}{}%
%%  \def\enotesize{\footnotesize}% \baselineskip1\Cvs
%%  \let\enoteheading\relax
%%  \def\enoteformat{\rightskip\z@ \leftskip\z@ \parindent9\p@
%%    \noindent\hbox to 15\p@{\hss\makeenmark\,}}%
%% }{}%
 %% enumerate.sty
 \@ifpackageloaded{enumerate}{%
  \def\@@enum@[#1]{%
    \@enLab{}\let\@enThe\@enQmark
    \@enloop#1\@enum@
    \ifx\@enThe\@enQmark\@warning{The counter will not be printed.%
     ^^J\space\@spaces\@spaces\@spaces The label is: \the\@enLab}\fi
    \expandafter\edef\csname label\@enumctr\endcsname{\the\@enLab}%
    \expandafter\let\csname the\@enumctr\endcsname\@enThe
    \csname c@\@enumctr\endcsname7
    \expandafter\settowidth
              \csname leftmargin\romannumeral\@enumdepth\endcsname
              {\the\@enLab\hspace{\labelsep}}% 
    \@enum@}%
  \def\@enum@{%
   \list{\csname label\@enumctr\endcsname}%
    {\labelsep5\p@
     \expandafter\leftmargin\csname leftmargin\romannumeral\@enumdepth\endcsname
     \advance \leftmargin 10\p@
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     %%
     \usecounter{\@enumctr}\def\makelabel##1{\hss\llap{##1}}}%
  }%
 }{}%
 %% jumoline
 \@ifpackageloaded{jumoline}{%
  \UnderlineDepth.75mm % .75mm
  \UMOlineThickness0.12mm
 }{}%
 %% nidanfloat
 \@ifpackageloaded{nidanfloat}{%
  \renewcommand\dblbotfraction{0.9}% 0.5
  \setcounter{dblbotnumber}{4}% 2
 }{}%
}

%%\AtEndDocument{%
%% \@ifundefined{theendnotes}{}{%
%%  \pagebreak[2]%
%%  \noindent
%%  \rule[1.5mm]{40mm}{.25mm}\par
%%  \nopagebreak
%%  \begingroup
%%   \IfFileExists{\jobname.ent}{%
%%    \theendnotes
%%   }{}%
%%  \endgroup
%% }%
%%}

\pagestyle{bothstyle}
\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
 \twocolumn
 \flushbottom
 \sloppy
\else
  \onecolumn
\fi
\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi

\endinput
