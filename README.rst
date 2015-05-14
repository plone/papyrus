Papyrus - the Plone user manual buildout
========================================

.. class:: foobar

	This repository is a work in progress to create up-to-date user manual for
	Plone with fully automated screenshots.

You can view the result on http://docs.plone.org

.. contents:: :local:


Features
---------
- Building automated documentation
- fully automated screenshots
- Spell check
- Link check
- PDF creation
- ePub creation

Documentation
-------------

Full documentation for end users can be found in the `docs <https://github.com/plone/papyrus/tree/master/docs>`_ folder.

`Working with Robots <https://github.com/plone/papyrus/tree/master/docs/robots.rst>`_


Installation
------------

For installations instructions please read the `installation <https://github.com/plone/papyrus/tree/master/docs/install.rst>`_ docs.

**Requirements:**

Since Papyrus uses robot-framework for fully automated screenshots, the buildout will install Plone.
Also, to generate PDF, you'll need latex, which is a large package.
To install Papyrus with all features and possibilites on Ubuntu 14.04 you will need:

.. code-block:: bash

    python2.7
    python2.7-dev
    git
    build-essential
    enchant
    python-virtualenv
    python-dev
    libjpeg-dev
    libxml2-dev
    libxslt-dev
    libz-dev
    firefox
    texlive-latex-extra
    texlive-latex-recommended


Contribute
----------

- Issue Tracker: github.com/plone/papyrus/issues
- Source Code: github.com/collective/papyrus

License
-------

Copyright © 2013-2014 Plone Foundation and individual contributors.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
USA.
