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

