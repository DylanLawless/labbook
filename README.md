# About
This is a LaTeX template for my labbook.
Examples are included to be modified to suit you. 
The main document labbook_2020 should be compiled with latex and bibtex a couple of times. 
This should match whatever modern tex system is used.
The EPFL style is not official.

Feel free to reuse this template.

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
# Snippets
If you use Vim, snippets can be use for very quick writing - this can includes shortkeys for things like project labels, headings, etc.
Snippets can be file specific, in this case I have many that I use for tex files.
Consider a vim command that can add the \section{ } and today's date for the daily entry. 

# Vim LaTeX labbook
I use Vim to write my LaTeX files. I use the vimtex plugin in combination with a pdf reader that automatically refreshes with a file changes. 
(https://github.com/lervag/vimtex),
(https://skim-app.sourceforge.io).

To automate my labbook writing I add this to my 
~/bash_profile:

alias cl="vim -p \
     ~/labbook/main/contents_1.tex \
     ~/labbook/labbook_2020.tex"

From my terminal, the command "cl" (short for Captain's log) will then open both the "content_1.tex" and main "labbook_2020.tex" files in two tabs. 
The first will be the daily log where I can quickly add a line. 
If I desire, I will change to the other tab with vim normal mode command "gt". 
In this master file I can then compile the document using the vimtex compile command "\ll".
This will trigger the compiled pdf to open and since my pdf reader can update automatiaclly, I can switch back and forth to the daily log and write complex entries and view the pdf in parallel.

# Input markdown
I write a website with modular topics written in markdown files.
To input those same markdown files (which I will for some methods) do:


% In your preamble (head/settings.tex)
\usepackage[smartEllipses]{markdown}
% In the main body of your document (content_1.tex)
\markdownInput{example.md}


Within-file markdown can be used also.

I have some LaTeX used in my markdown files so this would become nested LaTeX.
% In your preamble
\usepackage[hybrid]{markdown}
% In the main body of your document
\begin{markdown}
Inline math equations go in like so: $\omega = d\phi / dt$. 


\begin{equation}
I = \int \rho R^{2} dV
\end{equation}
\end{markdown}
