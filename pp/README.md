PP — A Generic Preprocessor (with Pandoc in mind)
=================================================

PP is a cross-platform and open source text preprocessor designed for Pandoc (and more generally Markdown). PP provides a simple (yet extermely powerful and flexible) layer of macros on top of markdown source files, thus providing fine-grained control over what will be fed to pandoc.

PP places itself between markdown source input and pandoc’s input, like a filter, allowing realt-time manipulation of the markdown source contents through custom macros, environment variables, conditional statements, and by interfacing via the shell to external scripts, the filesystem and tools like GraphViz, PlantUML and ditaa diagrams — for which PP provides a set of built-in macros.

------------------------------------------------------------------------

<!-- #toc -->
-   [About PP](#about-pp)
-   [Features](#features)
-   [Introduction](#introduction)
-   [Tutorial](#tutorial)
    -   [CLI Usage](#cli-usage)
    -   [Our First Macro](#our-first-macro)
    -   [Macros With Arguments](#macros-with-arguments)
    -   [Passing Multiple Arguments](#passing-multiple-arguments)
    -   [Conditional Macros](#conditional-macros)
    -   [Concluding Remarks](#concluding-remarks)
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

Tutorial
========

Here follows an introductory tutorial which by no means replaces the full documentation that ships with PP — also available online:

-   <http://cdsoft.fr/pp/#usage>
-   <https://github.com/CDSoft/pp#usage>

All examples are for MS Windows, but with a few adjustments Linux and macOS users should easily adapt them to their OS. This tutorial makes no assumptions on your knowledge about command line usage — you might as well be someone who is considering switching to pandoc and PP, but have never used either of them before. Therefore I’ll start with the very basics, and gradually proceed into advanced usage. At every stage, reference links are provided for further readings. If you are an experienced user you might skip ahead, or just go for PP documentation directly.

CLI Usage
---------

PP consists of a single binary file (`pp.exe`). I’ll assume you have placed this executable somewhere accessible from the sytem `Path`, or that at least it’s inside your current working directory.

Open a CMD session, and at the prompt type:

    pp

You’ll get … *nothing*! PP is invoked and stays open waiting for the input stream to process, effectively blocking your session without returning control (and the prompt to you).

Now hit <kbd>Ctrl</kbd><kbd>C</kbd>: this will abort PP execution and return control of the session to you.

The first lesson we have learned from this is that PP, when invoked without any parameters and options, will launch ad wait from `STDIN` a stream of text to process. Like with files, a stream of text ends when the EOF (End Of File) character is found. Since we are not feeding any text stream on `STDIN`, PP will hang waiting forever.

> **NOTE**: If you’re having trouble following what has been said so far, before carrying on with this tutorial you might consider reading some articles and tutorials on working with command line, on what `STDIN`, `STDOUT` and text stream are, and how redirection works under Windows:
>
> -   [CMD Shell](http://ss64.com/nt/syntax-cmd.html) | [CMD.exe](http://ss64.com/nt/cmd.html) — at ss64.com
> -   [PATH](http://ss64.com/nt/path.html) — at ss64.com
> -   [Standard streams](https://en.wikipedia.org/wiki/Standard_streams) — at WikiPedia
> -   [Redirection](http://ss64.com/nt/syntax-redirection.html) — at ss64.com

Now type:

    pp -h

… this should print on your terminal screen PP’s help message:

    D:\pp-win>pp -h
    Usage: pp [options] [files]
    Options:
      -v                   Display the current version
      -h                   Display this help message
      -D<name>[=<value>]   Define a variable
      -U<name>             Undefine a variable
      -<lang>              Define the current language
                           <lang> can be fr, en
      -<format>            Define the current target format
                           <format> can be html, pdf, odf, epub, mobi
     -img=<prefix>         Define the prefix to add to output image path
    Files:
      filename             Preprocess an existing file
      -                    Preprocess stdin

    If no input file is specified, pp preprocesses stdin.

    More information here: http://cdsoft.fr/pp


    D:\pp-win>pp -h

If you’ve succesfully made it so far we can now procede with out first PP test file.

Our First Macro
---------------

We will now create some test files to play around with PP and pandoc. Create a folder for hosting the test files (in our example I’ll be using `D:\pp-win\`), and make sure that PP’s executable and pandoc are available on your `Path`. You’ll also need a plain-text editor (like [Notepad++](https://notepad-plus-plus.org/)).

During this tutorial we’ll be working with two files:

-   `source.md` — the markdown source file containing PP macros, created by you.
-   `output.md` — the markdown preprocessed file, created by PP after processing our source file `source.md`.

The idea is to exploit PP’s features offered by creating a source markdown file enriched with macros. Obviously, we can’t pass this source file directly to pandoc because pandoc wouldn’t know how to handle the macros therein contained. Instead, we’ll have PP preprocess our source file and “spit it out” in processed form as a new file: `output.md`. This new file created by PP will be a pure markdown file, because after preprocessing all the macros will be gone, replaced by the markdown contents they produced. It is the `output.md` that will be fed to pandoc for conversion (into whatever you want it to be converted to).

Open `source.md` in your editor and type:

    !define(note)(> **NOTE:** )
    !note This is a note.

in CMD type:

    pp source.md > output.md

You’ll see a new `output.md` file in the folder, open it in your editor. You should see the following contents:

``` markdown

> **NOTE:** This is a note.
```

Let’s see what just happened … In `source.md` we’ve defined our first macro:

    !define(note)(> **NOTE:** )

The macro used here is `!define()()`, a **built-in macro** which allows us to create a custom variable (also called `SYMBOL`). It’s syntax is `!define(SYMBOL)(VALUE)`, where `SYMBOL` is the name of the variable we want to create (in our case: `note`) and `VALUE` is the value we want to place inside it (in our case: the string `> **NOTE**:`). And this is exactly what PP does when it encounter our line of text: it defines a new variable called `note` and sets its value to `> **NOTE**:`, and then removes the macro from the source text (ie: in PP’s memory).

The purpose of our `note` variable is to “emit” (ie: print out) a pre-formatted markdown snippet to start notes in our document — ie: begin a blockquote (`>`) block, followed by “NOTE:” in bold, and a blank space.

On the next line we find `!note`. This macro holds our variable name: it consists of the macro’s `!` character (notice how also the previous macro started with an exclamation mark) followed by the name of the variable we’ve just created in the previous line (`note`). When PP encounters this macro it checks if the variable exists, and substitutes its occurence with its value.

In fact, if we examine the contents of `output.md` we’ll notice that:

-   in the first line the `!define` macro statement is gone (line is empty)
-   in the second line, `!note` has been replaced by its value: `> **NOTE:**`
-   the rest of the contents on the second line have been left unchanged (`This is a note.`).

What we’ve achieved is creating a shortcut for printing a predefined sequence of markdown text that we can use anywhere in our document, to easily format our notes. Of course, if this were all there is to PP’s macros it wouldn’t be something revolutionary, but fortunately for us this is just a simple example of the power of macros, and there are other advanced features that we shall now explore!

> NOTE: This was an example of a **user-defined macro** — don’t be confused by the fact that sometimes we refer to it as a variable, other times as macro. It is both: `note` is the name of the *variable* we created, but when we actually use it we are doing it through macros (the `!` part), so we can say that `!note` is a user-defined *macro* that emits a user-defined *variable*, and both the variable and the macro exist only becuse we’ve defined `note`, as opposed to built-in macros which exist in PP even if we don’t define them. Terminology aside, what matters is that you undertand how to use them.

Macros With Arguments
---------------------

Any user-defined macro can accept multiple arguments. Arguments are passed by the appending them to the variable name, each argument enclosed in brackets: `!varname(arg1)(arg2)`. Each argument can be handled within the `VALUE` part of the `!define()()` macro, where they will be available as variables (SYMBOLS) named as the number of their occurence: first argument will be `1`, second `2`, etc. Since they are variables themselves, arguments can be emited (printed) as any other SYMBOL, ie: `!1` will be substituted with the passed argument, and so on.

An example is worth a thousand words, so let’s edit `source.md` like this:

    !define(note)(> **NOTE !1:** )
    !note(ONE) This is first note.

    !note(TWO) This is second note.

… and let’s preprocess it (as before):

    pp source.md > output.md

Now the contents of `output.md` will be:

``` markdown

> **NOTE ONE:** This is first note.

> **NOTE TWO:** This is second note.
```

Can you see what we’ve done? We changed the definition of our `note` macro so that it will accept an argument that we then use as the note number in the emited substitution:

    !define(note)(> **NOTE !1:** )

… in the new version of the macro, the “`!1`” right after “`NOTE`” and before “`:`” will be substitute with the passed argument (whatever that might be). Also notice how we used the macros to emit the variable: “`!note(ONE)`”, and after that “`!note(TWO)`”. The strings within brackets (“`ONE`” and “`TWO`”) are the arguments we passed to the macro. When the `note` macro is espanded, the “`!1`” in “`> **NOTE !1:**`” will be replaced with whatever we passed as parameter.

Passing Multiple Arguments
--------------------------

Passing multiple arguments only requires to place the additional arguments in additional brackets: `!mymacroname(first)(second)(third)` All arguments will be available as symbols in the defined macro, and will be expanded wherever they apper in the definition’s VALUE part.

Let’s get to a new example, edit `source.md`:

    !define[song]["*!1*" by **!2** (!3)]
    My favorite songs are: !song(Obscured by Clouds)(Pink Floyd)(1972), 
    !song(Beautiful Boyz)(CocoRosie)(2005) and \song(A Loop In Time)(Wally Brill)(1997).

> **NOTE**: here we used square brackets `[]` instead of round ones! Yes you can: PP allows to use parenthesis `()`, square backets `[]` or braces interchangeably, as long as you use the same type with each macro. This is done to avoid conflicts when these symbols are employed as markdown syntax in the surrounding context and PP needs to know what is part of a macro and what not.
>
> Also the `!` has its valid substitute: `\`. In the example we’ve used it with the last macro: `\song(A Loop In Time)(Wally Brill)(1997)`.

… preprocess it (you should know how, by now), and check the result:

``` markdown

My favorite songs are: "*Obscured by Clouds*" by **Pink Floyd** (1972), 
"*Beautiful Boyz*" by **CocoRosie** (2005) and "*A Loop In Time*" by **Wally Brill** (1997).
```

But what happens if we omit an argument, or pass more arguments than defined in the macro? Let’s try it out … edit `source.md`:

    \define[song]["*!1*" by **!2** (!3)]
    My favorite songs are:

    - \song{Obscured by Clouds}{Pink Floyd}{1972}{UK}, 
    - !song[Beautiful Boyz][CocoRosie].

> **NOTE**: I’ve mixed the various possible brace types and `!`/`\` on purpose, to remind you that you can use any of these, at will.

Now, in this example we are passing one extra argument in the first song (“`UK`”) and one argument less in the second. Let’s process it with PP and look at the results:

``` markdown

My favorite songs are:

- "*Obscured by Clouds*" by **Pink Floyd** (1972), 
- "*Beautiful Boyz*" by **CocoRosie** (!3).
```

In the first case, the extra parameter is simply ignored because our macro definition doesn’t reference it (ie: no `!4` is there).

The second case is more interesting: `!3` is emited in place of the missing argument. This tells us that since no third argument was passed, no SYMBOL `3` exists within the macro’s context, therefore `!3` (in the macro definition) is treated as literal text, just a string void of any meaning for PP!

But this last example has unearthed a potential problem: we don’t want that ugly `!3` to popup in our final output. We need a way to handle a missing parameter, without having to write a separate macro. Fortunately we can: PP’s conditional built-in macros can come to our rescue!

Conditional Macros
------------------

Let’s change the previous example, so that `source.md` looks like this:

    \define[song]["*!1*" by **!2** (!ifdef{3}{!3}{*year unknown*})]
    My favorite songs are:

    + \song{Obscured by Clouds}{Pink Floyd}{1972}{UK}, 
    + !song[Beautiful Boyz][CocoRosie].

As you might notice, we’ve only changed the first line, toward the end, the part withing round braces (the braces have no macro-related meaning, they are just the typographic braces meant to enclose the year’s date).

Inside the braces we find a new macro: `!ifdef()()()`. Yes: it’s a macro nested inside a macro definition! With PP there a no limits to nesting macros withing macros — and you can easily grasp that the only limit to what you can do with it it’s your creativity!

The `!ifdef()` macros is defined as follows in PP’s documentation:

> **`!ifdef(SYMBOL)(TEXT_IF_DEFINED)[(TEXT_IF_NOT_DEFINED)]`**  
> if `SYMBOL` is defined in the current environnement `pp` preprocesses `TEXT_IF_DEFINED`. Otherwise it preprocesses `TEXT_IF_NOT_DEFINED`.

(`(TEXT_IF_NOT_DEFINED)` is within square brackets because is optional.)

So, in our example macro we have: `!ifdef{3}{!3}{*year unknown*}` which first checks if variable/symbol `3` exists. Since number-named symbols are passed arguments, it will only exist if we passed a third arugment. If it exists, it will emit `!3` (ie: the arugment we passed), else it will emit `*year unknown*`.

In fact, if we process this example, we get:

``` markdown

My favorite songs are:

- "*Obscured by Clouds*" by **Pink Floyd** (1972), 
- "*Beautiful Boyz*" by **CocoRosie** (*year unknown*).
```

Tada! No mory ugly `!3` this time … our previous macro can now handle missing arguments and produce some default text instead.

Concluding Remarks
------------------

If you’ve followed me all the through these examples, you’ve learned enough to carry on by yourself: you only need to read PP documentation, learn all the built-in macros and experiment with them.

Try nesting macros within macros, creating compelx conditional statements, until you get smart at seeing the potentials that PP can unleash in your markdown and pandoc workflow.

PP’s Environment
================

Being a command line tool, PP inherits the enviroment of its calling application. By environment we mean the environment variables defined by the hosting operating system (OS) — eg: the `Path` env-var in Windows —, and other variables set by the user, or by some scripts, within the context of a shell session, or a running application.

PP has full access to environment and its variables, and it allows us to interface from markdown source files with the environment through macros: we can use macros to get values of environment variables from within our markdown source files.

For example, `!env(PATH)` (on Windows) will emit the system environmet variable PATH (ie: `%Path%`).

> **NOTE**: Since v1.2, PP for Windows is case-insensitive with environment variables (see [issue \#5](https://github.com/CDSoft/pp/issues/5)).
