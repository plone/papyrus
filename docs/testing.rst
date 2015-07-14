Testing
=======

When you are working on the documentation you also want to test the docs.

**What does is mean ?**

We want to keep the quality of the docs high this means we test [check] for typos and broken links on a regular basis.

To make this as easy as possible you just can execute::

	make test

This will check the docs for broken links and typos, to see the results you have to browse to the *build* directory, here you will see::

	linkcheck/output.txt
	spell/output.txt

Here you can find the results of the tests and with this you are able to fix and improve the docs.


Spell check
-----------
When you run spell check, at some point you will get *messages* about certain typos, which are not really typos but *unknown* words, like Plone, zope or gcc.
The reason for that is, that these words are not in the dictionary.

To solve this, you can add these words to the file named **spelling_wordlist.txt**. If you run spell check for the next time, these words will be ignored.

If you add words to the list, please make sure to do that in **alphabetical order** or after you are done just sort the file with regular expressions.

To sort in alphabetical order you can just do:

.. code-block:: bash

	sort -f -s new_wordlist.txt > spelling_wordlist.txt



Todo
----

- write script to sort *spelling_wordlist* in *alphabetical order*, mayve even as *pre-commit* hook ?
- more testing::

        # command to run tests
        script: sphinx-build -nW -b html -d _build/doctrees . _build/html
        # Flags used here, not in `make html`:
        #  -n   Run in nit-picky mode. Currently, this generates warnings for all missing references.
        #  -W   Turn warnings into errors. This means that the build stops at the first warning and sphinx-build exits with exit status 1.

- find a way to test code snippets which we use in our docs, maybe::

        https://github.com/garbas/sphinx.testing
