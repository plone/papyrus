=======
Install
=======

Requirements
============

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

2. Build docs [html version, no screenshots]

   .. code:: bash

      $ make html

To generate just screenshots, do

   .. code:: bash

      $ make screenshots

To generate the full documentation, do

   .. code:: bash

      $ make full

(this is equivalent to "make clean && make screenshots && make html")

Note that this will also generate robotscreenshots, so you will see Firefox opening multiple times.


When you are not changing robotscreenshots, you can also run "make debug" which will be faster on multi-core machines.
