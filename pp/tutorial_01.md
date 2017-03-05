Introduction to PP
==================

    LEARNING SKILLS: Absolute beginner.
    TUTORIAL STATUS: First draft (WIP).

This introductiory tutorial to **PP** covers the following topics:

1.  What **PP** does,
2.  How to invoke **PP** from the command line,
3.  See a built-in **PP** macro in action.

**OBJECTIVES:** The aim of this tutorial is just to see **PP** in action and get a feel of what pre-processing macros are all about, how they work, and how they could be employed in a markdown workflow. You’ll also be shown how to do basic command line operations with `pp.exe` and how to handle its output — either save it to file or feed it to **pandoc**.

**REQUIREMENTS:** Both `pp.exe` and `pandoc.exe` should be available on the sytem `Path`. If you haven’t installed **pandoc**, see our [pandoc setup guide](../pandoc/README.md#pandoc-setup). The file `pp.exe` can be found in PP’s package: download it from the official website, unzip it and either place `pp.exe` in a folder which is on the system `Path`, or just copy it in the working folder used in this tutorial.

In this tutorial we’ll be using the following example files:

-   [`/examples/example1.md`](./examples/example1.md)
-   [`/examples/hello.c`](./examples/hello.c)

All examples are for MS Windows, but with a few adjustments Linux and macOS users should easily adapt them to their OS. This tutorial makes no assumptions on your knowledge about command line usage — you might as well be someone who is considering switching to **pandoc** and **PP**, but have never used either of them before. Therefore I’ll start with the very basics, and gradually proceed into advanced usage. At every stage, reference links are provided for further readings. If you are an experienced user you might skip ahead to next tutorial, or just go for **PP** documentation directly.

------------------------------------------------------------------------

<!-- #toc -->
-   [What Does PP Do?](#what-does-pp-do)
-   [CLI Usage](#cli-usage)
    -   [Invoking PP’s Help](#invoking-pps-help)
-   [Our First Usage Test](#our-first-usage-test)
-   [Meet A Macro: `!source()`](#meet-a-macro-source)
-   [Saving the Output to File](#saving-the-output-to-file)
-   [Redirecting to Pandoc](#redirecting-to-pandoc)

<!-- /toc -->

------------------------------------------------------------------------

What Does PP Do?
================

**PP** is a pre-processor written with **pandoc** markdown in mind. Its function is to take an input text and process any **PP** macros that it contains, then output the text with all its macros “expanded”; this output can then be passed on to **pandoc** for further processing (conversion, ecc.), or just saved to disk.

Basically, macros are just text substitutions that appear in a markdown source file, along the markdown syntax and contents. Macros have a syntax of their own, and they look like this:

-   `!macroname`
-   `!macroname(param1)`
-   `\macroname[param1][param2]`
-   `!macroname{param1}{param2}`

Notice how a macro’s name can be preceded by either a “`!`” or a “`\`” character, and that parameters can be enclosed in either parenthesis (“`(`…`)`”), square brackets (“`[`…`]`”) or curly braces (“`{`…`}`”) — this flexible approach was devised to avoid clashing with markdown syntax. Also, note that a macro might have no arguments or any number of arguments.

When **PP** encounters a macro in the input text, it “expands it” — ie: substitutes it with the textual result of that macro, which will depend on what the macro does. Since macros can be nested into each other, with unlimited depth, and because **PP** offers some conditional statement macros, very complex text manipulation can be achieved via **PP**.

CLI Usage
=========

**PP** consists of a single binary file (`pp.exe`). I’ll assume you have placed this executable somewhere accessible from the sytem `Path`, or that at least it’s inside your current working directory.

Open a CMD session, and at the prompt type `pp`:

``` nohighlight
D:\pp-win>pp
```

You’ll get … *nothing*! You’ve probably already tried this out by yourself, eager to use **PP** straight out of the box, and then found yourself wondering what’s going on. Here’s what’s just happened: **PP** is invoked and stays open waiting for the input stream to process, effectively blocking your session without returning control (and the prompt) to you.

The first lesson we have learned from this is that **PP**, when invoked without any parameters and options, will launch ad wait from `STDIN` a stream of text to process. Like with files, a stream of text ends when the EOF (End Of File) character is found. Since right now we are not feeding any text stream on `STDIN`, **PP** will hang waiting forever.

Far from being an error, this is a powerful feature that can be used to create a custom toolchain where some application feeds an input stream to **PP** via `STDIN` — but that’s about advanced use, so just make a note about it for future use!

Now hit <kbd>Ctrl</kbd><kbd>C</kbd>: this will abort **PP** execution and return control of the session to you.

> **NOTE**: If you’re having trouble following what has been said so far, before carrying on with this tutorial you might consider reading some articles and tutorials on working with command line, on what `STDIN`, `STDOUT` and text stream are, and how redirection works under Windows:
>
> -   [CMD Shell](http://ss64.com/nt/syntax-cmd.html) | [CMD.exe](http://ss64.com/nt/cmd.html) — at ss64.com
> -   [PATH](http://ss64.com/nt/path.html) — at ss64.com
> -   [Standard streams](https://en.wikipedia.org/wiki/Standard_streams) — at WikiPedia
> -   [Redirection](http://ss64.com/nt/syntax-redirection.html) — at ss64.com

Invoking PP’s Help
------------------

Now type `pp -h` in the CMD, it will print on your terminal screen **PP**’s help message:

``` nohighlight
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
```

Now you know how to get basic help on **PP**’s usage whenver you need.

From the built in help we gather that the minimal requirements for invoking **PP** is to provide an input file as parameter:

``` nohighlight
pp inputfile
```

… which will cause **PP** to pre-process `inputfile` and output the result on `STDOUT`. This input file(s) will be markdown files. Let’s try it out with one of the example files provdied in this repository.

Our First Usage Test
====================

Open the CMD inside the [`/examples/`](./examples/) subfolder, then type “`pp example1.md`”. You should see something like this in your shell window:

``` nohighlight
D:\GitHub\markdown-guide\pp\examples>pp example1.md
# Example 1

This simple C program will display "Hello, World!" on the screen.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.c}
#include<stdio.h>

main()
{
    printf("Hello World");

}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


D:\GitHub\markdown-guide\pp\examples>
```

What you see on screen is the pre-processed output of the [`example1.md`](./examples/example1.md) file. Let’s look at the actual source of the file: type “`type example1.md`” in the CMD:

``` nohighlight
D:\GitHub\markdown-guide\pp\examples>type example1.md
# Example 1

This simple C program will display "Hello, World!" on the screen.

!source(hello.c)(c)

D:\GitHub\markdown-guide\pp\examples>
```

Quite a huge difference between the source input and **PP**’s final output! The reason for this is the presence of the **PP** macro `!source(hello.c)(c)` in the source file (5th line), which after pre-processing is expanded into:

``` markdown
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.c}
#include<stdio.h>

main()
{
    printf("Hello World");

}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

So, we encountered our first **PP** macro. Let’s look into it…

Meet A Macro: `!source()`
=========================

Open the [`example1.md`](./examples/example1.md) file in a plain text editor (like **Notepad** or **Notepad++**) so that you can take a closer look at its contents.

Line 5 contains a **PP** macro:

``` nohighlight
!source(hello.c)(c)
```

You can easily tell that this isn’t markdown syntax, and you might recognize that it has a syntax similar to the macros examples found at the start of this tutorial — the presence of a “`!`” before the name, and of parameters enclosed in parenthesis. This is one of **PP**’s built-in macros; so let’s see what the official [**PP** documentation](https://github.com/CDSoft/pp#macros) says about it:

> **!src(FILENAME)\[(LANG)\], !source(FILENAME)\[(LANG)\]**
>
> formats an existing source file in a colorized code block.

This macro takes one or two arguments: a source-code filename (in our case: `hello.c`) and (optionally) the name of the language (in our case: `c`). **PP** then replaces the macro with the contents of that source-code file, enclosed in **pandoc** markdown style fenced code (`~~~`…) with the language attribute. This is how the actual macro substitution in the final output:

``` markdown
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.c}
#include<stdio.h>

main()
{
    printf("Hello World");

}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

Now open the [`hello.c`](./examples/hello.c) file in your editor and look at its contents:

``` c
#include<stdio.h>

main()
{
    printf("Hello World");

}
```

… as you can see, the C source code was reproduced verbatim within the fenced code markup.

This was a practical example of the power of **PP**’s macros, and a very handy way of including source code into your documents without having to cut and paste it manually — and thanks to **PP**, any changes in the source file will be reflected in the final processed document.

But so far all we got was the pre-processed text printed on screen (`STDOUT`). In a real working scenario we’d want to either:

-   feed the result to **pandoc**, or
-   write it to a file.

We’ll now look at how these two can be achieved.

Saving the Output to File
=========================

We’ll now write **PP**’s output to file, instead of to screen (`STDOUT`). You might have noticed from **PP**’s help that there are no options to specify an output file (unlike **pandoc**, which has the `--output=`/`-o` option). So the only way to go about it is to use redirection to file via “`>`”.

Just type “`pp example1.md > example1_output.md`” in the CMD:

``` nohighlight
D:\GitHub\markdown-guide\pp\examples>pp example1.md > example1_output.md

D:\GitHub\markdown-guide\pp\examples>
```

This time **PP**’s output didn’t get printed on the screen — actually, nothing was printed at all. A new `example1_output.md` file was created instead; this file is the pre-processed version of `example1.md`: all **PP** macros have been expanded into markdown, so it’s a fully compliant **pandoc** markdown source file.

Open [`example1_output.md`](./examples/example1_output.md) in a text editor and check its contents:

``` markdown
# Example 1

This simple C program will display "Hello, World!" on the screen.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.c}
#include<stdio.h>

main()
{
    printf("Hello World");

}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

… as you can see, it contains the same output that before we got on screen.

This approach has the limit of producing only a markdown output file. Since we are not invoking pandoc, we can’t benefit of any type of format conversion. Nevertheless, it can be useful in many scenarios. For example, we might wish to work with dual markdown sources folders: one being the “source’s source” folder, where markdown files contain **PP** macros; the other being the “built source” folder, containing pre-processed and fully compliant markdown files. This would allow us to easily maintain markdown documentation for our projects (eg: README files, a GitHub Wiki, or Jekyll source files) by benefiting from **PP**’s macros. We would be adding an extra layer on top of the usual markdown source files, but this would allow us to reuse the same markdown sources in different contexts: through **PP**’s conditional statements, the same markdown sources could produce slightly different markdown versions (one for the Wiki, another for GitHub Pages, etc).

> **NOTE**: If you need more information on Windows redirection and pipes, visit the following links:
>
> -   [Redirection](https://ss64.com/nt/syntax-redirection.html) — at ss64.com
> -   [Successive redirections explained (1&gt;&3 )](https://stackoverflow.com/questions/9878007/how-to-permanently-redirect-standard-error-back-to-the-console-again) — at Stack Overflow

Redirecting to Pandoc
=====================

Now we shall redirect the output of **PP** to **pandoc** via Windows’ pipes (“`|`”). In the CMD window type `pp example1.md | pandoc`:

``` nohighlight
D:\GitHub\markdown-guide\pp\examples>pp example1.md | pandoc
<h1 id="example-1">Example 1</h1>
<p>This simple C program will display &quot;Hello, World!&quot; on the screen.</p>
<div class="sourceCode"><pre class="sourceCode c"><code class="sourceCode c"><span class="pp">#include</span><span class="im">&lt;stdio.h&gt;</span>

main()
{
    printf(<span class="st">&quot;Hello World&quot;</span>);

}</code></pre></div>

D:\GitHub\markdown-guide\pp\examples>
```

The output of **PP** (ie: the pre-processed markdown) is piped to **pandoc** (ie: becomes its input). Since no parameters are passed to **pandoc**, it carries out the default action of converting markdown to html and print the result on `STDOUT`.

There are two ways to save **pandoc**’s output to a file:

-   Using file redirection (like we did before), or
-   Providing **pandoc**’s `--output=`/`-o` option.

The former solution is achived with:

``` nohighlight
pp example1.md | pandoc > example1_output.html
```

the latter with:

``` nohighlight
pp example1.md | pandoc -o example1_output.html
```

------------------------------------------------------------------------

If you’ve succesfully made it so far, you can procede to the [next tutorial](./tutorial_02.md).
