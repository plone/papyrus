======================
Building documentation
======================

.. toctree::
   :maxdepth: 2

.. topic:: How to build the docs

    Sometimes you want to build the docs of papyrus
    for getting a visual how the would look like, or maybe
    you want to build and deploy them.

Documentation Setup
===================

Papyrus follows the *best practices* of `Plone Documentation <http://docs.plone.org/about/documentation_styleguide.html>`_.

All the docs are written in *rst* [reStructuredText] and inside the */docs* directory.

If you add an document, please *do not forget* to update the index [index.rst].


Building
========

We use `mr.docs <http://mrdocs.readthedocs.io/en/latest/>`_ in order to build the documentation.

Requirements
------------

- `Docker <https://www.docker.com/>`_.


.. note::

    mr.docs is **only** meant to run **locally** for security reasons

Running a test build
====================
Make sure that you are in the */* of the papyrus repository

This will build a test version of the docs on html

.. code-block:: shell

    docker run -i --rm -v ${PWD}/docs:/build/docs:rw -u $(id -u):$(id -g) quay.io/tiramisu/mr.docs html

Running a production build
==========================

Make sure that you are in the */* of the papyrus repository

This will build a html version with a different configuration which is more suited for production

.. code-block:: shell

    docker run -it --rm -v ${PWD}/docs:/build/docs:rw -v ${PWD}/docs/conf.py:/build/conf/conf.py -u $(id -u):$(id -g) quay.io/tiramisu/mr.docs html


