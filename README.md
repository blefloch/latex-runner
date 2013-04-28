latex-runner: A set of interpreters written in LaTeX
====================================================
* E-mail: blflatex@gmail.com
* Released under the LaTeX Project Public License v1.3c or later
  See http://www.latex-project.org/lppl.txt

The `runner` LaTeX package provides interpreters for various
languages: this allows to embed code from supported languages
into a LaTeX file, and run them directly within TeX, without
external dependencies.  For instance,

    \runner{forth}[output = \result]% <= LaTeX code
    | ( Forth code)
      : FACTORIAL ( +n1 -- +n2)
      DUP 2 < IF DROP 1 ELSE
      DUP 1- RECURSE * THEN
      ;
    || ( Forth input)
    0 FACTORIAL . CR ( gives 1)
    3 FACTORIAL . CR ( gives 6)
    8 FACTORIAL . ( gives 40320)
    |
    % Back to LaTeX code.
    \typeout{\result}

instructs `runner` to interpret the code following it as Forth code, and
store its output in the command `\result`.  This value can later be
used, and here `\typeout{\result}` prints the result to the terminal.

The `\runner` command expects

1.  The name of the language as a braced argument.

2.  An optional list of key--values pairs (such as program-file, output,
interactive, ...), within square brackets.

3.  The program code in the given language: this is put within two
identical delimiters, similarly to LaTeX's `\verb` command.  In the
example, we used `|...|`.

4.  The program input, also put within two identical delimiters (again
`|...|` in our example).

Languages supported so far:

- Brainfuck
- Forth

This package requires up-to-date versions of the `l3kernel`,
`l3packages` and `l3experimental` bundles.

This is work in progress, all suggestions/comments/bug reports are
welcome!
