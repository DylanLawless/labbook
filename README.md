# About
This is a LaTeX template for my labbook.
Examples are included to be modified to suit you. 
The main document labbook_2020 should be compiled with latex and bibtex a couple of times. 
This should match whatever modern tex system is used.
The EPFL style is not official.

Feel free to reuse this template.

Send quick entries straight from the command line with a key-shortcut (clq) or open the master docuement from your terminal (cl) or editor.
Compile into a beautiful PDF rich in cross-linking, indexing, bibliography, footnotes, sidenotes, and more. 
A great way to keep track of time-ordered daily work, ideas, methods, links, etc. 
Since it is relatively modular, I may switch to Markdown instead of LaTeX in the future, although markdown files can be input in the current LaTeX document.
Results in a good quality labbook without haivng to worry about any formatting (although figures or tables may need to be checked for size if you add these). 

## Table of contents, color project tags, automatic dates
![](screen1.png)

## Tufte-style margin notes, footnotes, code font, figures
![](screen2.png)

## Bibliography via .bib, index important terms
![](screen3.png)

## Make quick entries from the command line with automatic date stamp
![](1.0_small.gif)

## Launch the main labbook file in vim from the command line
![](1.1_small.gif)

## Switch to the master latex file to compile the PDF
![](1.2_small.gif)

# Layout
[1] The main file is labbook_2020.tex.

[2] This inputs the files in the "head"; settings.tex and statement.tex.

[3] It then inputs the "main" contents_1. 
The content file is the main place for writing daily work.
I suggest adding additional contents every year (or whatever lineaer time period) to keep things modular and reduce the size of the current working file. 

[4] Methods.tex ares also kept in an additional file of "main" since I want a separate chapter that can be cross referenced from any of the contents files.
It therefore will not interrupt the timeline. 

[5] The "tail" is input for the bibliography and other sections that might be at the end, like appendix.

Other features include footnotes and margin notes that appear on the pages where they are used.
This, in combination with the wide margins, gives a "Tuft" style page.
Indexing can be used where it prints the word that is indexed in the margin as well are printing to the index section at the end of the document where it will give the index list and page numbers. 

# Suggestions
Check out this very impressive post on using LaTeX - ["How I'm able to take notes in mathematics lectures using LaTeX and Vim"](https://castel.dev/post/lecture-notes-1/).

# Snippets
If you use Vim, snippets can be use for very quick writing - this can includes shortkeys for things like project labels, headings, etc.
Snippets can be file specific, in this case I have many that I use for tex files.
Consider a vim command that can add the \section{ } and today's date for the daily entry. 

# Vim LaTeX labbook
I use Vim to write my LaTeX files. I use the vimtex plugin in combination with a pdf reader that automatically refreshes with a file changes.\
(https://github.com/lervag/vimtex)\
(https://skim-app.sourceforge.io).

To automate my labbook writing I add this to my 
.config (which is sourced by the ~/.bash_profile).

Edit this path to the location of your labbook.

alias cl="vim -p \
     ~/labbook/main/contents_1.tex \
     ~/labbook/labbook_2020.tex"

[Note: check the .quicklog.sh feature for another alias for adding quick entries]

From your terminal, the command "cl" (short for Captain's log) will then open both the "content_1.tex" and main "labbook_2020.tex" files in two tabs. 
The first will be the daily log where I can quickly add a line. 
If I desire, I will change to the other tab with vim normal mode command "gt". 
In this master file I can then compile the document using the vimtex compile command "\ll".
This will trigger the compiled pdf to open and since my pdf reader can update automatiaclly, I can switch back and forth to the daily log and write complex entries and view the pdf in parallel.

# Input markdown
[1] I write a website with modular topics written in markdown files.\
To input those same markdown files (which I will for some methods) do:

In your preamble (head/settings.tex):\
\usepackage[smartEllipses]{markdown}

In the main body of your document (content_1.tex):\
\markdownInput{example.md}

[2] Within-file markdown can be used also.

[3] I have some LaTeX used in my markdown files so this would become nested LaTeX.\
In your preamble:\
\usepackage[hybrid]{markdown}

In the main body of your document:\
\begin{markdown}\
Here is an inline math equations; $\omega = d\phi / dt$. \
And here is a stand-alone equation\
begin{equation}\
I = \int \rho R^{2} dV\
\end{equation}\
\end{markdown}

# Quick log
(See config for command line sourcing).
The best part of this project might be the quick log script.
".quicklog.sh" contains a bash shell script to allow for adding a one line entry to the labbook.
For every entry the date will be logged in ".log.date".
If today's date has already been used to add a section for today, then the new entry will simply be added as a new line for that day.
If this is the first entry today, then the formatted date (Fri, 3 Sep) will be first printed as a section name so that it is added to table of contacts.
The hidden ".log.date" should not get too large over time.
You could delete it every so often if there are so many entries to become large,
or modify the ".quicklog.sh" script to delete everything except the last line, i.e. "tail -1".
However, I will probably write something to read and summarise the log frequency and print a github-like plot in the labbook to see how frequently you add quicklogs.

Add this to your ~/.config \
Edit this path to the location of your labbook.\
alias clq="sh ~/labbook/.quicklog.sh

Then from your terminal simply add a quick entry using the command:\
"clq" (which stands for captain's log quick).

# Config and aliases
Aliases can be set to use quick access commands from your command line.
Example, "cl" to open the main files in vim, 
"clq" to add a quick one line entry directly,
"clt" to print out the lasts 5 lines of the contents.
For all aliases that you want to execute from the command line
the .config should list the desired command and the file path.

This .config file must be read by your ~/.bash_profile (on MacOS)
Other systems may use .bashrc, etc.
To source the .config file from you shell
place this code into your ~/.bash_profile and
change the labbook directory to match your path:

\# Use labbook aliases\
if [ -f ~/labbook/.config ];\
then\
   source ~/labbook/.config\
fi


To activate the new aliases open a new shell or run "source ~/.bash_profile"

# Additional 
Personally, I have this template as a submodule within my labbook. 
I have addded it with "git add submodule git@github.com:DylanLawless/labbook.git template".

