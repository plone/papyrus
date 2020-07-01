=======
Install
=======

Requirements
============

Since Papyrus uses robot-framework for fully automated screenshots, the buildout will install Plone.
Also, to generate PDF, you'll need latex, which is a large package.
To install Papyrus with all features and possibilites on Ubuntu 20.04 you will need:

.. code-block:: bash

    python3.8
    python3.8-dev
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

If you only want to create html docs, you can leave out the texlive-latex-extra and texlive-latex-recommend packages, which take up a large amount of diskspace and are only needed for PDF generation.


Quick Start
===========

1. Clone and bootstrap

.. code:: bash

   git clone -b 5.2 https://github.com/plone/papyrus.git
   cd papyrus
   virtualenv --python=python3.8 .
   source bin/activate
   pip install -r https://raw.githubusercontent.com/plone/buildout.coredev/5.2/requirements.txt
   bin/buildout

If buildout gets stuck in a loop installing setuptools and restarting,
a workaround is to halt the process hand-install certain versions:

.. code:: bash
  
   pip install zc.buildout==2.13.2
   pip install setuptools==42.0.2
   bin/buildout

2. Download the latest known good screenshots

   .. code:: bash

      $ cd source/documentation
      $ git clone https://github.com/plone/documentation-roboshots.git
      $ mv documentation-roboshots/* _robot/
      $ cd ../..


To generate the full documentation, do

   .. code:: bash

      $ make html

