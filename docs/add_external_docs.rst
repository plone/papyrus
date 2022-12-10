How to add external docs
========================

Not all the documentation of 5.docs.plone.org is located on https://github.com/plone/documentation/tree/5.2, some of them we fetch directly from the repository of the add-on.

.. note::

    The docs in the https://github.com/plone/documentation/tree/5.2 should have a complete documentation of Plone 5.x.
    However, we want to include the documentation for frequently used add-ons as well.
    This has a dual goal: it makes it easier for the audiences to work with Plone, and it will hopefully encourage the add-on author to document their add-ons better.

How it works
============

We use a git command called `git sparse <http://git-scm.com/docs/git-checkout>`_

In order to have this work correctly it is important that you follow the `best practice guidelines <http://5.docs.plone.org/about/documentation_styleguide_addons.html>`_ and place all you documentation of your Add-on into the folder **docs**.

To accomplish pulling in those docs, and **only** those docs, we have to declare them in ``checkouts-documentation.cfg``:

https://github.com/plone/papyrus/blob/5.2/checkouts-documentation.cfg

The version of external documentation should match the release that the main documentation targets.

First, you edit this file.

If the external doc is not part of the Plone standard sources used by the version of this documentation you have to add it to the ``[sources]`` section.

In any case you must add information about the new external docs to section ``[assembly-information]``. See the notes there how to do this.

Note that this doesn't affect the actual **placement** of those docs into the tree; you'll have to refer to it at the wanted location, usually with a TOC command.
See the mindmap for ideas, and consult with the team first when in doubt where this add-on documentation should go.

If the external docs are placed into the documentation anywhere **outside** the 'external' subdirectory, you must also add this location to the source/documentation/.gitignore file!
