# Japanese Words Frequency

## Purpose
This ruby program is based on the work of [Matsushita Tatsuhiko](http://www17408ui.sakura.ne.jp/tatsum/english/databaseE.html#vdrj), who analyzed a huge amount of books and websites to compile a database of the most frequently used words in Japanese.
These data contains 60 894 words. A word is rank by is **frequency**. There is no translation in it.
As language learner, you can identify which words are the most useful to learn.

This program tends to create a clearer way to read this useful content.
It'll generates HTML files containing vocabulary list in the **out** directory.
In the HTML file, each word contains an hyperlink to [jisho.org](https://www.jisho.org) for a translation.

There is no server side, everything is handle by [Vue.js](https://vuejs.org/).

## Usage
Install rake

    gem install rake

Run the program. Parameter *limit* is an integer. This is the maximum words to put in each HTML file.

    rake run[:limit]

Execute all unit tests

    rake test

Verify quality of code

    rake rubocop

## Usage (without rake)
Run the program. Parameter *limit* is an integer. This is the maximum words to put in each HTML file.

    ruby ./lib/main.rb :limit
