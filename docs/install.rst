=======
Install
=======

Requirements
============

Since Papyrus uses robot-framework for fully automated screenshots, the buildout will install Plone.
Also, to generate PDF, you'll need latex, which is a large package.
To install Papyrus with all features and possibilites on Ubuntu 18.04 you will need:

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
    libxslt1-dev
    zlib1g-dev
    firefox
    texlive-latex-extra
    texlive-latex-recommended

Quick Start
===========

1. Clone and bootstrap

.. code:: bash

   git clone -b 5.1 https://github.com/plone/papyrus.git
   cd papyrus
   virtualenv --python=python2.7 .
   source bin/activate
   pip install -r https://raw.githubusercontent.com/plone/buildout.coredev/5.1/requirements.txt
   bin/buildout

2. Download the latest known good screenshots

   .. code:: bash

      $ cd source/documentation
      $ git clone https://github.com/plone/documentation-roboshots.git
      $ mv documentation-roboshots/* _robot/


To generate the full documentation, do

   .. code:: bash

      $ make html

