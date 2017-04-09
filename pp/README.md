PP — A Generic Preprocessor (with Pandoc in mind)
=================================================

PP is a cross-platform and open source text preprocessor designed for Pandoc (and more generally Markdown). PP provides a simple (yet extermely powerful and flexible) layer of macros on top of markdown source files, thus providing fine-grained control over what will be fed to pandoc.

PP places itself between markdown source input and pandoc’s input, like a filter, allowing realt-time manipulation of the markdown source contents through custom macros, environment variables, conditional statements, and by interfacing via the shell to external scripts, the filesystem and tools like GraphViz, PlantUML and ditaa diagrams — for which PP provides a set of built-in macros.

------------------------------------------------------------------------

<!-- #toc -->
-   [About PP](#about-pp)
-   [Features](#features)
-   [Introduction](#introduction)
-   [Tutorials](#tutorials)
-   [Macros Libraries](#macros-libraries)
-   [PP’s Environment](#pps-environment)

<!-- /toc -->

------------------------------------------------------------------------

About PP
========

-   <http://cdsoft.fr/pp/>
-   <https://github.com/CDSoft/pp>

PP was created by Christophe Delord ([@CDSoft](https://github.com/CDSoft)), it’s written in Haskell and released under the terms of the [GNU GPL license](https://github.com/CDSoft/pp/blob/master/LICENSE).

Precompiled binary files for Windows, Linux and macOS are freely available for download from [CDSoft website](http://cdsoft.fr/pp/#installation).

PP comes as a lightweight and portable single binary file (no installation or setup needed), intended for command-line usage.

The project evolved from Christophe’s personal experience with pandoc: he began by integrating [GPP](https://logological.org/gpp) (General-Purpose Preprocessor) in his pandoc workflow; then he wrote [DPP](https://github.com/CDSoft/dpp), a Diagram Preprocessor for Pandoc which allows embedding GraphViz, PlantUML and ditaa diagrams in Markdown documents (PlantUML and ditaa are embedded in DPP); and finally he wrote PP, which merges the functionalities of GPP and DPP into a single standalone tool.

If you’ve followed PP development along the years, you’ll have noticed that since v1.0 PP doesn’t ship anymore with GPP and DPP binaries (on Windows: `gpp.exe` and `dpp.exe`). Now it ships as single binary file (on Windows: `pp.exe`) instead of three binaries, as it used to, which makes PP more portable than ever.

Features
========

PP introduces a set of powerful features and makes them available directly in your markdown source files (and streams):

-   built-in macros
-   user-defined macros
-   literate programming functionality
-   [**GraphViz**](http://graphviz.org/), [**PlantUML**](http://plantuml.sourceforge.net/) and [**ditaa**](http://ditaa.sourceforge.net/) diagrams in markdown source are rendered to images
-   **PlantUML** and **ditaa** ready (both embedded in PP, no external dependencies)
-   **Bash**, **Bat**, **Python** and **Haskell** scripts interfacing.

Introduction
============

While pandoc allows using variables and conditional statements within its templates, such features are not available within a markdown source document. Here enters the scene PP, the generic preprocessor (with Pandoc in mind).

PP adds macros to your markdown workflow. From PP’s README file:

> `pp` takes strings as input and incrementally builds an environment which is a lookup table containing variables and various other information. Built-in macros are Haskell functions that takes arguments (strings) and the current environment and build a new environment in the IO monad. User defined macros are simple definitions, arguments are numbered 1 to N.
>
> `pp` emits the preprocessed document on the standard output. Inputs are listed on the command line and concatenated, the standard input is used when no input is specified.

Being a preprocessor, PP takes as input a stream of text (a file, or a stream on `STDIN`), processes it looking for PP macros to “expand”, and when it has finished its job it emits the processed text as an output stream on `STDOUT` — it’s then up to you to decide what to do with this stream, you might pass it on to pandoc (as its markdown input), or save it to disk as a preprocessed markdown source file, or pass it on to some other script/app, or anything else you might wish to do with it.

It should be clear by now that PP is called a pre-processor because it interposes itself between a raw-markdown source and the final application that will process the markdown contents (ie: pandoc in our examples).

Now we must explore how PP preprocess documents; so far we’ve learned that PP relies on an *environment*, *variables*, and *macros*.

Tutorials
=========

Here are some PP tutorials, in growing order of complexity (from beginner to advanced):

1.  [Introduction to PP](./tutorial_01.md) — Invoking PP from the command line.
2.  [User-Defined Macros](./tutorial_02.md) — Creating user-defined macros.
3.  [Macros with Arguments](./tutorial_03.md) — Creating macros with multiple arguments.

All examples are for MS Windows, but with a few adjustments Linux and macOS users should easily adapt them to their OS. The tutorials by no means replace the full documentation that ships with PP — also available online:

-   <http://cdsoft.fr/pp/#usage>
-   <https://github.com/CDSoft/pp#usage>

> **NOTE:** The tutorials are still in early draft form. What used to be a single tutorial is being now split into multiple tutorials, each subject being expanded on in more depth. Some example files are now provided for the tutorials, hosted inside the [`/examples/`](./examples/) folder.

Macros Libraries
================

At the “Pandoc-Goodies” project you can find a growing collection of pp-macros:

-   <https://github.com/tajmone/pandoc-goodies/tree/master/pp>

PP’s Environment
================

Being a command line tool, PP inherits the enviroment of its calling application. By environment we mean the environment variables defined by the hosting operating system (OS) — eg: the `Path` env-var in Windows —, and other variables set by the user, or by some scripts, within the context of a shell session, or a running application.

PP has full access to environment and its variables, and it allows us to interface from markdown source files with the environment through macros: we can use macros to get values of environment variables from within our markdown source files.

For example, `!env(PATH)` (on Windows) will emit the system environmet variable PATH (ie: `%Path%`).

> **NOTE**: Since v1.2, PP for Windows is case-insensitive with environment variables (see [issue \#5](https://github.com/CDSoft/pp/issues/5)).
