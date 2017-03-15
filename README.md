The Markdown Guide for the Perplexed
====================================

The **markdown-guide** project is a collection of reviews, tutorials, documents, and scripts relating to markdown — in all its different flavors — and the existing tools to work with it.

This is the *Moreh Nevukhim* (מורה נבוכים) of all markdown seekers.

This project is maintained by Tristano Ajmone (aka T.Ajmonides), it was created in December 2016, and its title is a witty homage to the great *Rambam*.

The markdown-guide project is unrestrictedly free to use: it is released into the public domain under [Unlicense](./LICENSE) terms.

------------------------------------------------------------------------

<!-- #toc -->
-   [About Markdown](#about-markdown)
    -   [Markdown Flavors](#markdown-flavors)
        -   [GitHub Flavored Markdown](#github-flavored-markdown)
-   [Markdown Tools](#markdown-tools)
    -   [Editors](#editors)
    -   [CLI Tools](#cli-tools)
        -   [Pandoc](#pandoc)
-   [Markdown Parsers](#markdown-parsers)
-   [External Links](#external-links)
    -   [Frugal Guidance 2](#frugal-guidance-2)
-   [Awesomeness](#awesomeness)
    -   [Awesome Markdown](#awesome-markdown)
    -   [Awesome Kramdown](#awesome-kramdown)
    -   [Markdown Alternatives](#markdown-alternatives)

<!-- /toc -->

------------------------------------------------------------------------

About Markdown
==============

Documents on markdown history, its motives, how it evolved, etc.

-   <https://daringfireball.net/projects/markdown/> – John Gruber’s website: where it all started…
-   [Wikipedia entry for markdown](https://en.wikipedia.org/wiki/Markdown)

Markdown Flavors
----------------

-   [CommonMark Wiki: List of markdown flavors](https://github.com/jgm/CommonMark/wiki/Markdown-Flavors)

There are numerous markdown syntax variants, better known as «markdown flavors» or «dialects», each one differing from the Gruber’s original Markdown implementation in the way syntax rules are implemented and (usually) by introducing new features.

*(WIP – Work In Progress)*

### GitHub Flavored Markdown

GitHub Flavored Markdown (GFM) is the Markdown dialect used by GitHub to visualize user content on GitHub.com and GitHub Enterprise. It’s a very popular Markdown flavor, bringing to markdown some nice extra features – task-lists, emoji, keystrokes, and others.

On March 14th, 2017 [GitHub announced](https://github.com/blog/2333-a-formal-spec-for-github-flavored-markdown) its official formal specification for GFM, based on the CommonMark Spec:

-   [GitHub Flavored Markdown Spec](https://github.github.com/gfm/)
-   [GFM Spec details at GitHub Engineering](https://githubengineering.com/a-formal-spec-for-github-markdown/)

Markdown Tools
==============

Editors
-------

The [`/editors/`](./editors/) folder is dedicated to Markdown editing and editors:

-   [Introduction to Markdown Editing](./editors/README.md)
-   [Dedicated Makdown Editors](./editors/DEDICATED_EDITORS.md)

CLI Tools
---------

Command line tools to perform operations on markdown source files – such as conversion to and from other formats, source tidying up, auto-generation of TOC, etc.

### Pandoc

Pandoc is such a key tool in the world of markdown that it deserves a folder of its own within this repo:

-   [`/pandoc/`](./pandoc/) – pandoc related markdown resources.
-   [`/pp/`](./pp/) — PP, A Generic Preprocessor with Pandoc in mind.

Markdown Parsers
================

A first temptative list of markdown parsers:

| NAME                                                      | MD FLAVORS   | EXTENSIBLE | LANGUAGE   |
|-----------------------------------------------------------|--------------|------------|------------|
| [markdown-it](https://github.com/markdown-it/markdown-it) | CommonMark   | YES        | JavaScript |
| [marked](https://github.com/chjj/marked)                  | all MD + GFM |            | JavaScript |

> **NOTE**: Parsers are not being added in a systematic way right now. I’m just adding to the list those parser which, for one reason or another, I’m stumbling across during links-chasing. I do have a long list of parsers to add in my shopping list, and will eventually get around to properly fill this table.

External Links
==============

Frugal Guidance 2
-----------------

**Markdown for Bloggers**:

1.  [Introduction](http://andybrandt531.com/2015/03/markdown-for-bloggers-part-1/)
2.  [Basic Formatting](http://andybrandt531.com/2015/03/markdown-for-bloggers-part-2-basic-formatting/)
3.  [Headlines & Lists](http://andybrandt531.com/2015/03/markdown-for-bloggers-part-3-headlines-lists/)
4.  [Web Links](http://andybrandt531.com/2015/03/markdown-for-bloggers-part-4-web-links/)
5.  [Quoting Text and Code](http://andybrandt531.com/2015/03/markdown-for-bloggers-part-5-quoting-textcode/)
6.  [The Monster List of Markdown Tools](http://andybrandt531.com/2015/03/markdown-for-bloggers-part-6-monster-list-of-markdown-tools/) (2015)

Awesomeness
===========

> “Only awesome is awesome”
>
> – *The awesome manifesto* [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome/blob/master/awesome.md)

Awesome Markdown
----------------

-   [**Awesome Markdown Editors & (Pre)viewers**](https://github.com/mundimark/awesome-markdown-editors) (@mundimark) – A collection of awesome markdown editors & (pre)viewers for Linux, Apple OS X, Microsoft Windows, the World Wide Web & more.
-   [**Awesome Markdown**](https://github.com/BubuAnabelas/awesome-markdown) (@BubuAnabelas) – A curated list of delightful Markdown stuff.
-   [**Awesome Markdown**](https://github.com/mashk/awesome-markdown) (@mashk) – A curated list of awesome Markdown tools.
-   [**Awesome Markdown**](https://github.com/mundimark/awesome-markdown) (@mundimark) – A collection of awesome markdown goodies (libraries, services, editors, tools, cheatsheets, etc.)
-   [**Markdown Resources**](https://github.com/rhythmus/markdown-resources) (@rhythmus) – A curated collection of Markdown resources: apps, dialects, parsers, people, …

Awesome Kramdown
----------------

-   [**Awesome kramdown**](https://github.com/viennahtml/awesome-kramdown) (@viennahtml) – A collection of awesome kramdown goodies for the markdown converter made with ♥ in Vienna ;-)

Markdown Alternatives
---------------------

-   [**Awesome Markdown Alternatives**](https://github.com/mundimark/awesome-markdown-alternatives) (@mundimark)

