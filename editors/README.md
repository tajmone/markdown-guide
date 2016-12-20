Editing Markdown
================

In this page you’ll find introductiory information about markdown editing. If you are looking for documents on specific topics, you may jump to:

-   [Dedicated Makdown Editors](./DEDICATED_EDITORS.md) – a curated list of markdown-specific editors.

<!-- #toc -->
-   [Introduction](#introduction)
-   [What to Expect from a Markdown Editor](#what-to-expect-from-a-markdown-editor)
    -   [Intuitive & Smart Key-Bindings](#intuitive--smart-key-bindings)
        -   [Characters Auto-Pairing](#characters-auto-pairing)
        -   [Smart Paste](#smart-paste)

<!-- /toc -->
Introduction
============

Markdown was designed to be simple and editable with any plaintext editor. But this hasn’t stopped developers from coming up with solutions to further simplify the task of editing markdown – developers always want it faster, easier and better (and not necessary in this order).

What to Expect from a Markdown Editor
=====================================

Be it a dedicated markdown editor, or a general code editor with markdown-related plugins/extensions, there are a number of features that you’ll be looking for (or, maybe, you never felt a need for them … until you discovered they exist). Let’s go through some of them, so that we may learn what to look for when chosing a markdown editing tool.

Intuitive & Smart Key-Bindings
------------------------------

Obviously, you don’t want to type two underscores `__` (or asterisks `**`) before and after each text to **bold** , you’d rather select the text, hit <kbd>Ctrl</kbd> + <kbd>B</kbd> and have it automatically **bolded** – and so on with the rest of inline formatting elements.

The same goes for blocks elements too: you surely *don’t* want to type three backticks ```` ``` ```` (or tildes `~~~`) before and after each codeblock – especially if you have a non-US keyboard, requiring some esoteric Alt-codes to produce these characters! You’d rather want some smart key bindings that allows you to wrap a whole selection into the desired block elements.

### Characters Auto-Pairing

A good text editor will provide auto-pairing for characters which go together in pairs: typing a quote character `"` should produce another quote just after the caret, so the user will be typing inside the opening and closing quotes. Or pressing the quotes key `"` when some text is selected, the editor should enclose the whole text within quotes and remove selection.

Similary, with parenthesis `(` and square brackets `[` the editor should produce the matching closing parenthesis/bracket.

In markdown this is needed for a number of characters: square brackets and parenthis are used in links, backticks are used for inline code.

This feature usually works also for inline formatting elements: typing `_` or `*` will enclose a word (or the caret) between *italic* markers, and pressing it once more will transform it into **bold**. This can give access to those markup elements which might not have a keybinding of their own – eg: strikethrough (`~~`), which is not used so often as bold or italic, might lack a key binding of its own, but can be easily implement by auto-pairing the tilde.

Any editor worth its salt should offer this functionality.

[**Ghostwriter**](./DEDICATED_EDITORS.md#ghostwriter) editor allows to configure auto-pairing from the “Customize Matched Characters…” menu: the user can choose to enable/disable auto-matching for predefined characters (double quotes, single quotes, parentheses, square brackets, braces, asterisks, underscores, backticks, angle brackets).

### Smart Paste

**SublimeText**’s [MarkdownEditing](https://github.com/SublimeText-Markdown/MarkdownEditing) plugin offers some really cool markdown pasting functionality:

| Mac                                  | Win/Linux                                  | Description             |
|--------------------------------------|--------------------------------------------|-------------------------|
| <kbd>⌘</kbd><kbd>⌥</kbd><kbd>V</kbd> | <kbd>Ctrl</kbd><kbd>Win</kbd><kbd>V</kbd>  | Paste as inline link    |
| <kbd>⌘</kbd><kbd>⌥</kbd><kbd>R</kbd> | <kbd>Ctrl</kbd><kbd>Win</kbd><kbd>R</kbd>  | Paste as reference link |
| <kbd>⌘</kbd><kbd>⇧</kbd><kbd>K</kbd> | <kbd>Shift</kbd><kbd>Win</kbd><kbd>K</kbd> | Paste as inline image   |

In other words, if you have copied a valid URL into the clipboard, and invoke one of these special paste operations on a selecte text, the text will be transformed into a fully qualified link. If the clipboard is empty, or contains an invalid URL, an empty link is created for the selection (the URL part reamins empty).

This feature is a real time saver, destined to boost up your productivity time and deliver you from the evils of repetitious boring tasks – especially in editors like SublimeText, which allow working with multiple cursors and slections.

------------------------------------------------------------------------

> TO BE CONTINUED…
