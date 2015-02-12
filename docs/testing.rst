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
When you run spell check, at some point you will get *messages* about certain typos, which are not really typos but *unkonwm* words, like Plone, zope or gcc.
The reason for that is, that these words are not in the dictionary.

To solve this, you can add these words to the file named **spelling_wordlist.txt**. If you run spell check for the next time, these words will be ignored.

If you add words to the list, please make sure to do that in **alphabetical order** or after you are done just sort the file with regular expressions.
