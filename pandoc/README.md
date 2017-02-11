Pandoc
======

As it name suggests, **pandoc** is the panacea for documents inter-format conversions. It support a variety of markdown formats, and can also be used to convert a markdown document to its input format, to perform cleanup operations.

> You might also want to look at [**PP**](../pp/) Generic Preprocessor (with Pandoc in mind), a powerful tool to enhance pandoc workflow via macros.

------------------------------------------------------------------------

<!-- #toc -->
-   [About Pandoc](#about-pandoc)
    -   [Pandoc Tech Specs](#pandoc-tech-specs)
        -   [Pandoc Supported Markdown Formats](#pandoc-supported-markdown-formats)
        -   [Pandoc Supported Markdown Extensions](#pandoc-supported-markdown-extensions)
        -   [Pandoc Supported Formats](#pandoc-supported-formats)
-   [Pandoc Setup](#pandoc-setup)
    -   [MS Windows](#ms-windows)
        -   [Pandoc MSI Installer](#pandoc-msi-installer)
        -   [Pandoc via Chocolatey](#pandoc-via-chocolatey)
        -   [Pandoc Standalone](#pandoc-standalone)
-   [Scripts](#scripts)

<!-- /toc -->

------------------------------------------------------------------------

About Pandoc
============

-   [Pandoc website](http://pandoc.org/) | [User’s Guide](http://pandoc.org/MANUAL.html)
-   [Pandoc’s GitHub repo](https://github.com/jgm/pandoc)
-   [Pandoc download page](https://github.com/jgm/pandoc/releases/latest)
-   [Pandoc entry at Wikipedia](https://en.wikipedia.org/wiki/Pandoc)

Pandoc is a cross-platform FOSS command line tool for converting documents from one format to another. It natively supports [**22** input- and **41** output-formats](#pandoc-supported-formats), and can be extended to work with custom input (*reader*) and outupt (*writer*) formats through external scripts – likes the custom BBCode writers in this project.

Pandoc is written in Haskell, and precompiled binary releases for Windows, Mac OS X and Linux are available for download.

Pandoc was originally created by [John MacFarlane](http://johnmacfarlane.net/), a philosophy professor at the University of California, Berkeley, and is now maintained collaboratively on [GitHub](https://github.com/jgm/pandoc).

Pandoc Tech Specs
-----------------

### Pandoc Supported Markdown Formats

As of pandoc v1.19.1, the supported Markdow formats are:

1.  `markdown` – [pandoc’s extended Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown).
2.  `markdown_github` – [GitHub-Flavored Markdown](https://help.github.com/articles/about-writing-and-formatting-on-github/).
3.  `markdown_mmd` – [MultiMarkdown](http://fletcherpenney.net/multimarkdown/).
4.  `markdown_phpextra` – [PHP Markdown Extra](https://michelf.ca/projects/php-markdown/extra/).
5.  `markdown_strict` – original unextended [Markdown](http://daringfireball.net/projects/markdown/).

### Pandoc Supported Markdown Extensions

As of pandoc v1.19.2.1, there are 59 supported Markdown extensions – here shown preceded by a `+` or `-` indicating whether it is enabled by default in pandoc’s Markdown:

|     | Ext. Name                    |     | Ext. Name                           |
|-----|------------------------------|-----|-------------------------------------|
| -   | `abbreviations`              | +   | `intraword_underscores`             |
| +   | `all_symbols_escapable`      | +   | `latex_macros`                      |
| -   | `angle_brackets_escapable`   | +   | `line_blocks`                       |
| -   | `ascii_identifiers`          | +   | `link_attributes`                   |
| +   | `auto_identifiers`           | -   | `lists_without_preceding_blankline` |
| -   | `autolink_bare_uris`         | -   | `literate_haskell`                  |
| +   | `backtick_code_blocks`       | -   | `markdown_attribute`                |
| +   | `blank_before_blockquote`    | +   | `markdown_in_html_blocks`           |
| +   | `blank_before_header`        | -   | `mmd_header_identifiers`            |
| +   | `bracketed_spans`            | -   | `mmd_link_attributes`               |
| +   | `citations`                  | -   | `mmd_title_block`                   |
| -   | `compact_definition_lists`   | +   | `multiline_tables`                  |
| +   | `definition_lists`           | +   | `native_divs`                       |
| -   | `east_asian_line_breaks`     | +   | `native_spans`                      |
| -   | `emoji`                      | +   | `pandoc_title_block`                |
| -   | `epub_html_exts`             | +   | `pipe_tables`                       |
| +   | `escaped_line_breaks`        | +   | `raw_html`                          |
| +   | `example_lists`              | +   | `raw_tex`                           |
| +   | `fancy_lists`                | +   | `shortcut_reference_links`          |
| +   | `fenced_code_attributes`     | +   | `simple_tables`                     |
| +   | `fenced_code_blocks`         | +   | `startnum`                          |
| +   | `footnotes`                  | +   | `strikeout`                         |
| +   | `grid_tables`                | +   | `subscript`                         |
| -   | `hard_line_breaks`           | +   | `superscript`                       |
| +   | `header_attributes`          | +   | `table_captions`                    |
| -   | `ignore_line_breaks`         | +   | `tex_math_dollars`                  |
| +   | `implicit_figures`           | -   | `tex_math_double_backslash`         |
| +   | `implicit_header_references` | -   | `tex_math_single_backslash`         |
| +   | `inline_code_attributes`     | +   | `yaml_metadata_block`               |
| +   | `inline_notes`               |     |                                     |

You can view a list of all markdown extensions supported in pandoc by typing:

``` nohighlight
pandoc --list-extensions
```

### Pandoc Supported Formats

As of v1.19.2.1, pandoc supports **22** input- and **41** output-formats:

| INPUT               | OUTPUT              | DESC                                                                                                                                                                                                        |
|---------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `asciidoc`          | —                   | [AsciiDoc](http://asciidoc.org/)                                                                                                                                                                            |
| `beamer`            | —                   | [beamer slide shows](https://ctan.org/pkg/beamer)                                                                                                                                                           |
| `commonmark`        | `commonmark`        | [CommonMark Markdown](http://commonmark.org/).                                                                                                                                                              |
| `docbook`           | `docbook`           | [DocBook 4](http://docbook.org/schemas/4x) – [*DocBook 4 Guide*](http://docbook.org/tdg/).                                                                                                                  |
|                     | `docbook5`          | [DocBook 5](http://docbook.org/).                                                                                                                                                                           |
| `context`           | `context`           | [ConTeXt](http://wiki.contextgarden.net/Main_Page)                                                                                                                                                                        |
| `docx`              | `docx`              | Word [docx](https://en.wikipedia.org/wiki/Office_Open_XML).                                                                                                                                                 |
| —                   | `dokuwiki`          | [DokuWiki markup](https://www.dokuwiki.org/dokuwiki)                                                                                                                                                        |
| —                   | `dzslides`          | [DZSlides](http://paulrouget.com/dzslides/)                                                                                                                                                                 |
| `epub`              | `epub`              | [EPUB v2](http://idpf.org/epub/201) book.                                                                                                                                                                   |
|                     | `epub3`             | [EPUB v3](http://idpf.org/epub/301) book.                                                                                                                                                                   |
| —                   | `fb2`               | [FictionBook2 e-book](http://www.fictionbook.org/index.php/Eng:XML_Schema_Fictionbook_2.1)                                                                                                                  |
| `haddock`           | `haddock`           | [Haddock markup](https://www.haskell.org/haddock/doc/html/ch03s08.html).                                                                                                                                    |
| `html`              | `html`              | HTML 4.                                                                                                                                                                                                     |
|                     | `html5`             | HTML 5                                                                                                                                                                                                      |
| —                   | `icml`              | [InDesign IDML](https://www.adobe.com/content/dam/Adobe/en/devnet/indesign/cs55-docs/IDML/idml-specification.pdf) &gt; [ICML](http://blogs.adobe.com/indesignsdk/idml_file_types/ "InCopy Markup Language") |
| `json`              | `json`              | [JSON](http://www.json.org/) version of native AST.                                                                                                                                                         |
| `latex`             | `latex`             | [LaTeX](https://www.latex-project.org).                                                                                                                                                                     |
| —                   | `man`               | [groff man](http://developer.apple.com/DOCUMENTATION/Darwin/Reference/ManPages/man7/groff_man.7.html) pages                                                                                                 |
| `markdown`          | `markdown`          | [pandoc’s extended Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown).                                                                                                                               |
| `markdown_github`   | `markdown_github`   | [GitHub-Flavored Markdown](https://help.github.com/articles/about-writing-and-formatting-on-github/).                                                                                                       |
| `markdown_mmd`      | `markdown_mmd`      | [MultiMarkdown](http://fletcherpenney.net/multimarkdown/).                                                                                                                                                  |
| `markdown_phpextra` | `markdown_phpextra` | [PHP Markdown Extra](https://michelf.ca/projects/php-markdown/extra/).                                                                                                                                      |
| `markdown_strict`   | `markdown_strict`   | original unextended [Markdown](http://daringfireball.net/projects/markdown/).                                                                                                                               |
| `mediawiki`         | `mediawiki`         | [MediaWiki markup](https://www.mediawiki.org/wiki/Help:Formatting).                                                                                                                                         |
| `native`            | `native`            | native [Haskell](https://www.haskell.org/).                                                                                                                                                                 |
| `odt`               | `odt`               | [ODT](http://en.wikipedia.org/wiki/OpenDocument) (Open Document Format for Office Applications).                                                                                                            |
| `opml`              | `opml`              | [OPML](http://dev.opml.org/spec2.html) (Outline Processor Markup Language).                                                                                                                                 |
| `org`               | `org`               | [Emacs Org mode](http://orgmode.org/).                                                                                                                                                                      |
| —                   | `plain`             | plain text                                                                                                                                                                                                  |
|                     | `revealjs`          | [revealjs](http://lab.hakim.se/reveal-js/)                                                                                                                                                                  |
| `rst`               | `rst`               | [reStructuredText](http://docutils.sourceforge.net/docs/ref/rst/introduction.html).                                                                                                                         |
| —                   | `rtf`               | [Rich Text Format](http://en.wikipedia.org/wiki/Rich_Text_Format)                                                                                                                                           |
| —                   | `s5`                | [S5 HTML slide shows](http://meyerweb.com/eric/tools/s5/)                                                                                                                                                   |
| —                   | `slideous`          | [Slideous](http://goessner.net/articles/slideous/)                                                                                                                                                          |
| —                   | `slidy`             | [Slidy](http://www.w3.org/Talks/Tools/Slidy/)                                                                                                                                                               |
| `t2t`               | —                   | [txt2tags](http://txt2tags.org/).                                                                                                                                                                           |
| —                   | `tei`               | [TEI Simple](https://github.com/TEIC/TEI-Simple)                                                                                                                                                            |
| —                   | `texinfo`           | [GNU Texinfo](http://www.gnu.org/software/texinfo/)                                                                                                                                                         |
| `textile`           | `textile`           | (subsets of) [Textile](http://redcloth.org/textile).                                                                                                                                                        |
| `twiki`             | —                   | [TWiki markup](http://twiki.org/cgi-bin/view/TWiki/TextFormattingRules).                                                                                                                                    |
| —                   | `zimwiki`           | [ZimWiki markup](http://zim-wiki.org/manual/Help/Wiki_Syntax.html)                                                                                                                                          |

You can view a list of all input formats supported in pandoc by typing:

``` nohighlight
pandoc --list-input-formats
```

You can view a list of all output formats supported in pandoc by typing:

``` nohighlight
pandoc --list-output-formats
```

There is also the [`list-pandoc-formats.bat`](./list-pandoc-formats.bat) script for generating text files of pandoc’s supported: input/output formats, markdown extensions, highlight languages and styles.

Pandoc Setup
============

Instructions on how to setup pandoc.

MS Windows
----------

You have different choices for setting up pandoc:

1.  [Use pandoc’s msi installer](#pandoc-msi-installer)
2.  [Install via Chocolatey](#pandoc-via-chocolatey)
3.  [Use pandoc executable in standalone mode](#pandoc-standalone)

The advised choice is **\#2** – install via Chocolatey!

### Pandoc MSI Installer

Pandoc for Windows ships with an msi installer.

When asked, choose “install pandoc for current user” (best choice).

### Pandoc via Chocolatey

Since Pandoc doesn’t (can’t) check for updates, the best method of installation is via [Chocolatey](https://chocolatey.org/) (or [ChocolateyGUI](https://chocolatey.org/packages/ChocolateyGUI)):

-   [Pandoc package](https://chocolatey.org/packages/pandoc) at Chocolatey.org

Chocolatey handles silent installation and updates in the background (using default options), and helps you keeping pandoc always updated to the latest release.

### Pandoc Standalone

If you prefer to use pandoc in standalone mode, you’ll need to extract pandoc binary executable from the installer file – for some reasons, the standalone version is no longer available for download. The installer contains two binary files (`pandoc.exe` and `pandoc-citeproc.exe`), the html User’s Guide and the license files.

1.  Dowload the pandoc msi installer (eg: `pandoc-1.XX-windows.msi`)
2.  Unpack it (using [7-Zip](http://www.7-zip.org/)) and extract and rename the `pandocEXE` file to `pandoc.exe`
3.  Optionally (if you need to use [CiteProc](https://en.wikipedia.org/wiki/CiteProc) for working with citations and bibliography files) also extract `pandoc_citeprocEXE` and rename it to `pandoc_citeproc.exe`.

Make sure that `pandoc.exe` (and, eventually, `pandoc_citeproc.exe`) is reachable via `%PATH%`.

Scripts
=======

-   [`list-pandoc-formats.bat`](./list-pandoc-formats.bat) – generates txt files listing pandoc’s supported: input/output formats, markdown extensions, highlight languages and styles.

