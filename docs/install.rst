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

	$ git clone git@github.com:plone/papyrus.git
	$ cd papyrus
    $ git checkout -b 5.0

	$ virtualenv --python=python2.7 .
	$ source bin/activate
	$ pip install -r requirements.txt
	$ python bootstrap-buildout.py --setuptools-version=7.0 --version=2.2.5
	$ bin/buildout

2. Retrieve external documentation

.. code:: bash

	$ make externals

3. Start server

.. code:: bash

	$ make serve

4. Build docs [html version]

.. code:: bash

    $ make html
