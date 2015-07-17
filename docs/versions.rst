Versions
========

Currently we are building the docs, for Plone 3 and Plone 4. This is done via
the branches for the different versions.

**Documentation:**

.. code-block:: bash

	Plone 3: https://github.com/plone/documentation/tree/3.3
	Plone 4: https://github.com/plone/documentation/tree/master
	Plone 5: https://github.com/plone/documentation/tree/5.0

As soon as Plone 5 will be released, the 5.0 branch will be the new master.

**Papyrus:**

.. code-block:: bash

	Plone 3: https://github.com/plone/papyrus/tree/3.3
	Plone 4: https://github.com/plone/papyrus/tree/master
	Plone 5: https://github.com/plone/documentation/tree/5.0

As soon as Plone 5 will be released, the 5.0 branch will be the new master

For building docs, for Plone 3, for example you do a checkout of papyrus, switch to the 3.3 branch and start the building.

Definition of the branch of the plone version is done under the *source section* in the *buildout.cfg* of your papyrus branch, for example

.. code-block:: bash

	...
	[sources]
	documentation = git https://github.com/plone/documentation.git egg=false branch=3.3
	...

This tells buildout to checkout the branch 3.3, which is Plone 3.3
