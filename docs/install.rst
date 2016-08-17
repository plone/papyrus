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
	$ bin/buildout

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


