Versions
========

Currently we are building the docs, for Plone 5.0.x, 4.x and 3.x
This is done via the branches for the different versions.

**Documentation:**

.. code-block:: bash

	Plone 3: https://github.com/plone/documentation/tree/3.3
	Plone 4: https://github.com/plone/documentation/tree/4.3
	Plone 5: https://github.com/plone/documentation/tree/5.0

The "default" branch on github is Plone 5, as of 19 sept 2015.


**Papyrus:**

.. code-block:: bash

	Plone 3: https://github.com/plone/papyrus/tree/3.3
	Plone 4: https://github.com/plone/papyrus/tree/4.3
	Plone 5: https://github.com/plone/papyrus/tree/5.0


For building docs, for Plone 3, for example you do a checkout of papyrus, switch to the 3.3 branch and start the building.

Definition of the branch of the plone version, for papyrus versions 3.3 and 4.4 is done under the *source section* in the *buildout.cfg* of your papyrus branch, for example

.. code-block:: bash

	...
	[sources]
	documentation = git https://github.com/plone/documentation.git egg=false branch=3.3
	...

This tells buildout to checkout the branch 3.3, which is Plone 3.3

For papyrus 5.0, we switched to a new method of defining sources, there you can find the branch definition in the file checkouts-documentation.cfg


Upcoming versions
-----------------

There exists also a branch 

.. code-block:: bash

	Plone 5.1: https://github.com/plone/documentation/tree/5.1
	
with corresponding 

.. code-block:: bash

	Plone 5.1: https://github.com/plone/papyrus/tree/5.1
	
This is not built and published on docs.plone.org, but is the right place to already place documentation for the upcoming version of Plone.

What to do when a new minor release comes out
---------------------------------------------

When a minor release comes out, or better yet when it is still in soft-release test the new version like this:

- change the version in buildout.cfg line 4 where it says ``http://dist.plone.org/release/5.0-latest/versions.cfg`` to the right versions.cfg
- visit also this URL in a browser
- and find and replace any new version number tags of external packages as defined in checkouts-documentation.cfg

The versions in checkouts-documentation.cfg should be identical to the ones in the versions.cfg referenced in buildout.cfg.
That way you will have matching documentation to the actual released versions.

Of course, when testing upcoming or experimental versions of documentation you could temporarily switch any of these to an experimental branch, but for the released versions of docs.plone.org they should remain synchronized.
