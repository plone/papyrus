How to add external docs
========================

Not all of the documentation of docs.plone.org is located on https://github.com/plone/documentation, some of them we fetch directly from the repository of the add-on.

.. note::

    The docs in the https://github.com/plone/documentation should have a complete documentation of Plone.
    However, we want to include the documentation for frequently used add-ons as well.
    This has a dual goal: it makes it easier for the audiences to work with Plone, and it will hopefully encourage the add-on author to document their add-ons better.

How it works
============

We use a git command called `git sparse <http://git-scm.com/docs/git-checkout>`_

In order to have this work correctly it is important that you follow the `best practice guidelines <http://docs.plone.org/about/documentation_styleguide_addons.html>`_ and place all you documentation of your Add-on into the folder **docs**.

To accomplish pulling in those docs, and **only** those docs, we have to declare them in ``checkouts-documentation.cfg``:

https://github.com/plone/papyrus/blob/master/checkouts-documentation.cfg

The version of external documentation should match the release the main documentation targets at.

First, you edit this file.

If the source is not part of the ``buildout.coredev`` ``sources.cfg`` used by the version of this documentation you have to add it to the ``[sources]`` section.

I any case you must add some information about the documentation to section ``[assembly-information]``. See the notes there how to do this.

Note that this doesn't affect the actual **placement** of those docs into the tree; you'll have to refer to it at the wanted location, usually with a TOC command.
See the mindmap for ideas, and consult with the team first when in doubt where this add-on documentation should go.
