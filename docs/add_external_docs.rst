How to add external docs
========================

Not all of the documentation of docs.plone.org is located on https://github.com/plone/documentation, some of them we fetch directly from the
repository of the add-on.

.. note:: Explain the difference better and why and so on

How is that working
===================

We use a git command called `git sparse <http://git-scm.com/docs/git-checkout>`_

In order to getting this work it is important that you follow the `best practice guidelines <http://docs.plone.org/about/documentation_styleguide_addons.html>`_ and place all you documentation of your Add-on into the folder **docs**.

To accomplish that we use do two steps:

https://github.com/plone/papyrus/blob/master/externals.txt

First, you edit this file, in the fist part the github repository and in the second part the path to which is should get sourced, this is usually something like source/documentation/external/

Second, when you later build the documentation you have to execute the script: get_external_doc.sh, which will fetch the files and configure spares for you.
