Macros With Arguments
---------------------

        LEARNING SKILLS: Beginner.
        TUTORIAL STATUS: First draft (WIP).

**OBJECTIVES:** Learn how macros arguments work and how to implement them.

**REQUIREMENTS:** You should understand how basic macros (ie: macros without parameters) work.

------------------------------------------------------------------------

<!-- #toc -->
-   [Macros Arguments](#macros-arguments)
-   [Passing Multiple Arguments](#passing-multiple-arguments)
-   [Conditional Macros](#conditional-macros)
-   [Concluding Remarks](#concluding-remarks)

<!-- /toc -->

------------------------------------------------------------------------

Macros Arguments
================

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
==========================

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
==================

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
==================

If you’ve followed me all the through these examples, you’ve learned enough to carry on by yourself: you only need to read PP documentation, learn all the built-in macros and experiment with them.

Try nesting macros within macros, creating compelx conditional statements, until you get smart at seeing the potentials that PP can unleash in your markdown and pandoc workflow.
