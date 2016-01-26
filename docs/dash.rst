Generating Dash Docsets
=======================

Q: What is Dash http://kapeli.com/dash ?

A: Dash is an API Documentation Browser and Code Snippet Manager. Dash stores snippets of code and instantly searches offline documentation sets for 150+ APIs.


Setup
=====

The docsets are built using a Sphinx extension: `sphinxcontrib.dashbuilder <https://pypi.python.org/pypi/sphinxcontrib-dashbuilder>`_

Building the docset is best done after a complete 'fresh' run of generating the docs, so do in sequence:

.. code-block::

	$ make clean
	$ make html
	$ make dash

Package it into a docset:

.. code-block::

    $ tar --exclude='.DS_Store' -cvzf Plone.tgz Plone5.docset


