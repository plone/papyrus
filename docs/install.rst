=======
Install
=======

Requirements
============

Since Papyrus uses robot-framework for fully automated screenshots, the buildout will install Plone.
Also, to generate PDF, you'll need latex, which is a large package.
To install Papyrus with all features and possibilities on Ubuntu 22.04 you will need:

.. code-block:: bash

    python3
    python3-dev
    git
    build-essential
    python3-enchant
    python3-virtualenv
    libjpeg-dev
    libxml2-dev
    libxslt1-dev
    zlib1g-dev
    firefox
    texlive-latex-extra
    texlive-latex-recommended

If you only want to create html docs, you can leave out the texlive-latex-extra and texlive-latex-recommended packages, which take up a large amount of diskspace and are only needed for PDF generation.


Quick Start
===========

1. Clone and bootstrap

.. code:: bash

   git clone -b 5.2 https://github.com/plone/papyrus.git
   cd papyrus
   virtualenv --python=python3.10 .
   source bin/activate
   pip install -r https://raw.githubusercontent.com/plone/buildout.coredev/5.2/requirements.txt
   bin/buildout

If buildout gets stuck in a loop installing setuptools and restarting,
a workaround is to halt the process hand-install certain versions:

.. code:: bash

   pip install zc.buildout==65.7.0
   pip install setuptools==3.0.1
   bin/buildout
   
NOTE: when building on Python 3.10, there is an issue where buildout can't download Zope==4.8.7 as the metadata for the wheel says Python < 3.9. 
Current workaround/hack is to download the wheel file, change that metadata, pip install the wheel locally

2. Download the latest known good screenshots

   .. code:: bash

      $ cd source/documentation
      $ git clone https://github.com/plone/documentation-roboshots.git
      $ mv documentation-roboshots/* _robot/
      $ cd ../..


To generate the full documentation, do

   .. code:: bash

      $ make html

