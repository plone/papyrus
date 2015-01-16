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

Building the docset, depending on the version, like for Plone 3 or Plone 4:

.. code-block::

    doc2dash -n Plone4 --icon dash/icon.png build/html/en

Fixing the Info.plist file:

.. code-block::

    cd Plone4.docset/Contents
    rm Info.plist
    wget https://raw.githubusercontent.com/plone/papyrus/master/dash/Info.plist

Adding icon:

.. code-block::

    cd Pone4.docset/Contents/Resources/Documents
    wget https://raw.githubusercontent.com/plone/papyrus/master/dash/icon.png


Archive your docset using:

.. code-block::

    tar --exclude='.DS_Store' -cvzf Plone4.tgz Plone4.docset

Follow further this instructions: https://github.com/Kapeli/Dash-User-Contributions#contribute-a-new-docset

Missing
-------
- Part about uploading to docs.plone.org and changing the build version in
  plone4.xml/plone3.xml
- Write a script to automate all this
