Versions
========

Currently we are building the docs, for Plone 3 and Plone 4.
This is done via the branches for the different versions.

**Documentation:**

.. code-block:: bash

	Plone 3: https://github.com/plone/documentation/tree/3.3
	Plone 4: https://github.com/plone/documentation/tree/4.3
	Plone 5: https://github.com/plone/documentation/tree/5.2

The "default" branch on github is Plone 5, as of 19 sept 2015.

**Papyrus:**

.. code-block:: bash

	Plone 3: https://github.com/plone/papyrus/tree/3.3
	Plone 4: https://github.com/plone/papyrus/tree/4.3
	Plone 5: https://github.com/plone/papyrus/tree/5.2


For building docs, for Plone 3, for example you do a checkout of papyrus, switch to the 3.3 branch and start the building.

Definition of the branch of the plone version, for papyrus versions 3.3 and 4.4 is done under the *source section* in the *buildout.cfg* of your papyrus branch, for example

.. code-block:: bash

	...
	[sources]
	documentation = git https://github.com/plone/documentation.git egg=false branch=3.3
	...

This tells buildout to checkout the branch 3.3, which is Plone 3.3

For papyrus 5.x, we switched to a new method of defining sources, there you can find the branch definition in the file checkouts-documentation.cfg