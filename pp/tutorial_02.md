User-Defined Macros
===================

        LEARNING SKILLS: Beginner.
        TUTORIAL STATUS: First draft (WIP).

This **PP** tutorial covers the following topics:

1.  How to create a user-defined macro.

**OBJECTIVES:** Create and test a simple user-defined macro to create markdown formatted notes-blocks.

**REQUIREMENTS:** Both **PP** and **pandoc** should be on the system path. You’ll also need a plain text editor.

------------------------------------------------------------------------

<!-- #toc -->
-   [Our First Macro](#our-first-macro)

<!-- /toc -->

------------------------------------------------------------------------

Our First Macro
===============

We will now create some test files to play around with **PP** and **pandoc**. Create a folder for hosting the test files (in our example I’ll be using `D:\pp-win\`), and make sure that **PP**’s executable and **pandoc** are available on your `Path`. You’ll also need a plain-text editor (Windows’ **Notepad** is fine, but you might be better off with something like [Notepad++](https://notepad-plus-plus.org/)).

During this tutorial we’ll be working with two files:

-   `source.md` — the markdown source file containing **PP** macros, created by you.
-   `output.md` — the markdown preprocessed file, created by **PP** after processing our source file `source.md`.

The idea is to exploit **PP**’s features offered by creating a source markdown file enriched with macros. Obviously, we can’t pass this source file directly to **pandoc** because **pandoc** wouldn’t know how to handle the macros therein contained. Instead, we’ll have **PP** preprocess our source file and “spit it out” in processed form as a new file: `output.md`. This new file created by **PP** will be a pure markdown file, because after preprocessing all the macros will be gone, replaced by the markdown contents they produced. It is the `output.md` that will be fed to **pandoc** for conversion (into whatever you want it to be converted to).

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

The macro used here is `!define()()`, a **built-in macro** which allows us to create a custom variable (also called `SYMBOL`). It’s syntax is `!define(SYMBOL)(VALUE)`, where `SYMBOL` is the name of the variable we want to create (in our case: `note`) and `VALUE` is the value we want to place inside it (in our case: the string `> **NOTE**:`). And this is exactly what **PP** does when it encounter our line of text: it defines a new variable called `note` and sets its value to `> **NOTE**:`, and then removes the macro from the source text (ie: in **PP**’s memory).

The purpose of our `note` variable is to “emit” (ie: print out) a pre-formatted markdown snippet to start notes in our document — ie: begin a blockquote (`>`) block, followed by “NOTE:” in bold, and a blank space.

On the next line we find `!note`. This macro holds our variable name: it consists of the macro’s `!` character (notice how also the previous macro started with an exclamation mark) followed by the name of the variable we’ve just created in the previous line (`note`). When **PP** encounters this macro it checks if the variable exists, and substitutes its occurence with its value.

In fact, if we examine the contents of `output.md` we’ll notice that:

-   in the first line the `!define` macro statement is gone (line is empty)
-   in the second line, `!note` has been replaced by its value: `> **NOTE:**`
-   the rest of the contents on the second line have been left unchanged (`This is a note.`).

What we’ve achieved is creating a shortcut for printing a predefined sequence of markdown text that we can use anywhere in our document, to easily format our notes. Of course, if this were all there is to **PP**’s macros it wouldn’t be something revolutionary, but fortunately for us this is just a simple example of the power of macros, and there are other advanced features that we shall now explore!

> NOTE: This was an example of a **user-defined macro** — don’t be confused by the fact that sometimes we refer to it as a variable, other times as macro. It is both: `note` is the name of the *variable* we created, but when we actually use it we are doing it through macros (the `!` part), so we can say that `!note` is a user-defined *macro* that emits a user-defined *variable*, and both the variable and the macro exist only becuse we’ve defined `note`, as opposed to built-in macros which exist in **PP** even if we don’t define them. Terminology aside, what matters is that you undertand how to use them.

------------------------------------------------------------------------

If you’ve succesfully made it so far, you can procede to the [next tutorial](./tutorial_03.md).
