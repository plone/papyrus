=========
Blueprint
=========

What Is Papyrus Meant For
=========================

`Papyrus <https://github.com/plone/papyrus/>`_ is meant to be a tool to build our `docs <http://docs.plone.org>`_.

.. todo::

    This should be more generic, I would also be able to use it for the training docs.

Features
--------

- Building automated documentation for various versions of `Plone <https://plone.org>`_.

.. todo::

     Add training here, too

Current Situation
=================

A buildout based setup to run multiple versions of the plone documentation, which does:

- Building automated documentation
- Fully automated screen-shots
- Spell check
- Link check
- PDF creation
- ePub creation

Lessons Learned
===============

Our current setup is doing too much, it is fragile, has too many 'moving' dependencies, hard to maintain,
hard to configure, not user friendly and slowish.

Future
======

We are going back to the base, papyrus should be used for constructing [fetching various documentation parts]
and building the docs, that is all.

Because of the way how we do currently screen-shots, papyrus 1.5 will stay with buildout for exactly and only this part,
everything else will not buildout based anymore.

Further will we move parts like testing, translations/tranisfix and 'third party apps [ie dash]' out of the main setup.
We will keep documentation on how that works, but given the amount of user who use that, we do not need that in the main setup.

Testing will be standalone, possible based on mr.docs, coala and ttd-lint.
The test setup will be changed to run 'tests on the last committed files' and with a 'full test on all docs' during release builds.

For more on testing, please check https://github.com/testthedocs/plone.docs.qaframework

Deploys will be container based with faster releases, if CI tests are green,
CI will build a container, will test the container and initialize a deploy.

The configuration of papyrus should be easier and also doable by 'less technical people'.

Setup
=====

I would like to see a solution, where we do not need/use a branch per version.
If possible we should maintain all versions [docs.plone.org] from one branch.

Configuration
==============

Use something like a config.toml, where we do all the configuration:

.. code-block:: bash

    [Plone5]
    version = 5.1
    # List of repositories we include, one per line
    repositories = [
      "https://github.com/plone/Installers-UnifiedInstaller",
      "https://github.com/plone/plone.app.mosaic"
    ]

.. todo::

    Figure out a way to do pinning of version/branches

Next step, would be a script which reads the config.toml, puts it into a script and build the whole stuff.
