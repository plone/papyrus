Papyrus - the Plone user manual buildout
========================================

This repository is a work in progress to create up-to-date user manual for
Plone with fully automated screen-shots.

You can view the result on http://docs.plone.org

.. contents:: :local:


Features
---------
- Building automated documentation
- fully automated screen-shots
- Spell check
- Link check
- PDF creation
- ePub creation

Documentation
-------------

Full documentation for end users can be found in the `docs <https://github.com/plone/papyrus/tree/5.1/docs>`_ folder.

`Working with Robots <https://github.com/plone/papyrus/tree/5.0/docs/robots.rst>`_


Installation
------------

**Requirements:**

Since Papyrus uses robot-framework for fully automated screen-shots, the buildout will install Plone.
Also, to generate PDF, you'll need latex, which is a large package.
To install Papyrus with all features and possibilities on Ubuntu 14.04 you will need:

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

Quick start
-----------

1. Clone and bootstrap

.. code:: bash

   git clone -b 5.1 git@github.com:plone/papyrus.git
   cd papyrus
   virtualenv --python=python2.7 .
   source bin/activate
   pip install -r https://raw.githubusercontent.com/plone/buildout.coredev/5.1/requirements.txt
   bin/buildout

2. Build docs [html version, no screen-shots]

.. code:: bash

    $ make html

To generate screen-shots, you will have to set up a browser and a webdriver to work with robotframework.
See docs/webdriver.rst for how to install these for Firefox, Chrome and Phantomjs
Once you have done that, you can use one of the following commands:

.. code:: bash

    $ make screenshots-firefox
    $ make screenshots-chrome
    $ make screenshots-phantomjs

To generate the full documentation, do

.. code:: bash

    $ make clean
    $ make screenshots-$browser (choose one, Chrome gives good results)
    $ make html

Contribute
----------

- Issue Tracker: github.com/plone/papyrus/issues
- Source Code: github.com/collective/papyrus

License
-------

Copyright © 2013-2016 Plone Foundation and individual contributors.

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
