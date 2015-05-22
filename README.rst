Papyrus - the Plone user manual buildout
========================================

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

Quick start
-----------

1. Clone and bootstrap

   .. code:: bash

      $ git clone git@github.com:plone/papyrus.git
      $ cd papyrus

      $ virtualenv --python=python2.7 .
      $ source bin/activate
      $ git checkout 5.0
      $ pip install -r requirements.txt
      $ python bootstrap-buildout.py --setuptools-version=7.0 --version=2.2.5
      $ bin/buildout

2. Retrieve external documentation

  .. code:: bash

     $ get_external_doc.sh

3. Start server

   .. code:: bash

      $ make serve

4. Build docs [html version]

   .. code:: bash

      $ make html


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
