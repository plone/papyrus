Generating Dash Docsets
=======================

Q: What is Dash http://kapeli.com/dash ?

A: Dash is an API Documentation Browser and Code Snippet Manager. Dash stores snippets of code and instantly searches offline documentation sets for 150+ APIs.

Use http://pypi.python.org/pypi/doc2dash to generate docsets from Python, Sphinx or PyDoctor-generated documentation.

Setup
=====

Install doc2dash, since there are some 'version dependecies problems' when installing doc2dash via buildout for now, that is the reason why we use pip

.. code-block::

    pip install --user doc2dash

Building the docset

.. code-block::

    doc2dash -n Plone build/html/en

Archive your docset using:

.. code-block::

    tar --exclude='.DS_Store' -cvzf Plone.tgz Plone.docset

Follow further this instructions: https://github.com/Kapeli/Dash-User-Contributions#contribute-a-new-docset

Missing
-------

- Part of copying the info.plist file
- Write a script to automate all this
