==================
New Way Of Testing
==================

- All these tests, should run in CI.
- Run reST tests on each commit on latest files, not on the whole docs
- Run HTML tests, after all other tests passed on already build HTML we want to deploy.


reST
====

Sphinx
------

- Use Sphinx [mr.docs] for nit-picky mode

TTD-LINT
--------

- Use ttd- of plone-lint for 'black words' checking

Spell-check
-----------

- Use Sphinx or something else for spell-check

Link-check
----------

Various options here, all of them are not perfect

- Sphinx: not stable, horror to configure 'ignores', slow
- Coala: not stable, checks are not trustable

HTML
====

Test HTML builds, including links, 'alt tags' for pictures and so on

- htmlproof
- htmltest

Both in docker, ``htmlproof`` is more mature, ``htmltest`` is easy to configure faster and **not** ruby based !


