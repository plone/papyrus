============
Translations
============

In order to use Sphinx together with Transifex

Update your buildout and add needed configuration

.. code-block :: shell

    parts +=
    ...
    sphinx-intl
    transifex-client

    [sphinx-intl]
    recipe = zc.recipe.egg
    eggs =
    sphinx-intl [transifex]
    sphinx.themes.plone

Adjust your sphinx configuration under ```# -- Options for HTML output ------------```


.. code-block:: shell

    html_theme_options = {
        'doc_languages' : [
        {'lang_code':'en','lang_name':'English'},
        {'lang_code':'it','lang_name':'Italian'}
        ],
    }
