# Documentation contribution guide

## Do's

### Inline math

Use: `$...$` instead of `\( ... \)`

### Equations

Use:
```latex
\[ 
    ...
\]
```
instead of `$$ ... $$`

### Blocks

Use `\begin{definition}... \end{definition}`, likewise for `equation`, `remark`, `theorem`, `claim` and so forth, in order to structure your document.

### Cross references and labels

Use `\label{}` and `\cref{}` to reference blocks througout your document.
The label names should follow the conventions set in the document you are contributing to. If no convention is specified, you can fallback to the following naming convention:
- `sec:<section-name>` if the label applies to a section
- `ssec:<subsection-name>` if the label applies to a subsection
- `sssec:<subsubsection-name>` if the label applies to a subsubsection
- `fig:<figure-name>` if the label applies to a figure
- `def:<definition-name>` if the label applies to a definition
- `eq:<equation-name>` if the label applies to a equation

### Citations

Use: the argument of `\cite` to precise what you cite.
Eg: `\cite[Section X.X.X]{yourBibtexEntry}`

### Macros

Use the macros defined in [cryptocode](http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/cryptocode/cryptocode.pdf) when possible.

When introducing new macros, define a `style` macro for each type of macro. Then, use the defined `style` to define the set of macros of the corresponding type.
Doing so makes it trivial to change the style of a family of macros, and helps keeping papers clean and easy to maintain/extend.

Here is an example:
```latex
% macros.tex

% Algorithms
\newcommand{\algostyle}[1]{\mathsf{#1}}
\newcommand{\verify}{\ensuremath{\algostyle{Verify}}\xspace}
\newcommand{\txgen}{\ensuremath{\algostyle{TxGen}}\xspace}
...

% Units
\newcommand{\unitstyle}[1]{\mathsf{#1}}
\newcommand{\ether}{\ensuremath{\unitstyle{Ether}}\xspace}
\newcommand{\wei}{\ensuremath{\unitstyle{Wei}}\xspace}

...

% Variables
\newcommand{\varstyle}[1]{\mathsf{#1}}
\newcommand{\varone}{\ensuremath{\varstyle{VarOne}}\xspace}
\newcommand{\vartwo}{\ensuremath{\varstyle{VarTwo}}\xspace}
```

## Dont's

- Do not use `...`, use `\ldots` or `\cdots` instead
- Don't use spacing in `\text{}` in math environment. Instead, use backslash + space to have a space in math mode `$\ $`
- Don't use `\\` to break lines
- Don't finish formulas with `.` systematically, only add a `.` if the end of the sentence is reached
- Don't use `"word"`. Use ``word'' instead.
- Don't write `for all`, `there exists` in math formula. Use quantifiers `\forall, \exists`

## General rule

When contributing to a document (likewise to code) do not diverge from the conventions adopted.

If you want to change a convention or introduce a new one, please open a pull request first, containing the changes you would like to make to this document, and add the tags `documentation`, `conventions`.
