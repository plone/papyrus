Install
=======

Requirements:
-------------
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

	$ git clone -b 5.0 https://github.com/plone/papyrus.git
	$ cd papyrus
	$ virtualenv --python=python2.7 .
	$ source bin/activate
	$ pip install -r requirements.txt
	$ python bootstrap-buildout.py --setuptools-version=18.0.1 --version=2.4.0
	$ bin/buildout

2. Build docs [html version]

.. code:: bash

      $ make html


Note that this will also generate robotscreenshots, so you will see Firefox opening multiple times.

Re-running "make html" will only create robotscreenshots that are new or changed, so the whole process is quicker.
When you are not changing robotscreenshots, you can also run "make debug" which will be significantly faster on multi-core machines.