Robots
======

Writing robot-scripts for screenshots is a daunting task at first,
but once it's done, it's easy to tweak those screenshots, re-generate translate
them in different languages or with different themes.

`Robot-refactored screenshots also work as acceptance tests for Plone.`__

__ http://jenkins.plone.org/view/User%20Docs/job/collective.usermanual/


Rules
-----

Please, see an example_ while reading these rules:

.. _example: https://raw.github.com/collective/collective.usermanual/robot-screenshots/source/adding-content/adding-pages.rst

1. Each document (``.rst``-file) represents one story for using Plone:

   Each document start with a clean Plone site, perform as many *robot tests*
   as required, in written order, to allow capturing the required screenshots,
   and clean up the site at the end.

2. Each document with screenshots should start (after its title) with
   ``.. include:: ../robot.rst``-line with correct path pointing to
   *robot.rst* file in the root of *./source*-directory for the documentation.

   This provides all common resources and the lifecycle management described in
   step 1.

3. After *.. include:: ../robot*-directive, each document may contain as many
   ``.. code:: robotframework`` -directives as required to generate the
   required screenshots.

   Each *.. code:: robotframework*-directive should contain a
   complete Robot Framework test suite snippet (starting with
   ``*** Settings ***``,  ``*** Variables ***``, ``*** Test Cases ***``
   or ``*** Keywords ***```).

   Each directive should also have (slightly magical) ``:class: hidden``-option
   to hide the test source from the produced document.
   (See also: `sphinxcontrib-robotframework -docs`__ for this integration.)

4. Each document may end with one ``.. robotframework::``-directive listing all
   the generated screenshot files in its ``:creates:``-option. This would
   prevent Sphinx from re-generating the screenshots on subsequent builds.

__ http://sphinxcontrib-robotframework.readthedocs.org/en/latest/


How to build
------------

We support two different build modes:

* standalone builds
* robot-server -dependent builds.

*Standalone*-build is executed with familiar ``make html`` and with it
each document can setup the required Plone sandboxes during the Sphinx
compilation process by itself. It's good for building the complete docs,
but is slow when used for writing the robot code for screenshots

*robot-server*-build requires robot-server to be started with ``make serve``
into foreground of one console, and then builds to be run with ``make robot``
on a different console. It uses the same Plone sandbox (with fast reset between
documents) for the whole build, which makes it pretty fast.


How to work on a single document
--------------------------------

1. Cleanup old builds and start the server

   .. code:: bash

      $ make clean serve

2. Run ``bin/pybot`` for that document

   .. code:: bash

      $ bin/pybot source/adding-content/adding-pages.rst


How to work on a new document
-----------------------------

1. Cleanup old builds and start the server

   .. code:: bash

      $ make clean serve

2. Insert ``.. include:: ../robot.rst`` into beginning of the document
   (after its title, with correct relative path to ``robot.rst``):

   .. code:: rst

      .. include:: ../robot.rst

3. Find a place for a new / refactored figure in the document and
   write / re-write figure-directive to point to a robot generated
   screenshot:

   .. code:: rst

      .. figure:: ../_robot/document-name_screenshot-name.png
         :alt: My figure
         :align: center

4. Add a new robot test for generating that figure with just a pause
   keyword letting to think it further:

   .. code:: rst

      .. code:: robotframework
         :class: hidden

         *** Test Cases ***

         Show how to write a robot generated image
             Pause
             Capture and crop page screenshot
             ...    ${CURDIR}/../_robot/document-name_screenshot-name.png
             ...    css=#content  css=#some-other-id

   **NOTE**: With *Capture and crop page screenshot*-keyword, please, prefix
   every screenshot filename with ``${CURDIR}/``. This is required to support
   executing the build with *pybot* in addition to Sphinx*.

5. Execute the file with *pybot*:

   .. code:: bash

      $ bin/pybot source/adding-content/adding-pages.rst

6. Learn, try, fix, repeat:

   * http://datakurre.pandala.org/2013/09/documentation-plausible-excuse-for.html
   * https://robotframework-selenium2screenshots.readthedocs.org/en/latest/
   * http://rtomac.github.io/robotframework-selenium2library/doc/Selenium2Library.html
   * http://robotframework.googlecode.com/hg/doc/libraries/BuiltIn.html?r=2.8.4
   * http://robotframework.googlecode.com/hg/doc/userguide/RobotFrameworkUserGuide.html?r=2.8.4

7. Try the results with sphinx:

   .. code:: bash

      $ make clean robot

8. Add ``.. robotframework::``-directive to prevent re-creating screenshots in
   subsequent builds (``make clean`` will still always force re-building the
   images):

   .. code:: rst

      .. robotframework::
         :creates: ../_robot/document-name_screenshot-name.png


Advanced topics
---------------

1. How to include the default Plone-content?

   .. code:: rst

      .. code:: robotframework

         *** Test Cases ***

         Show Plone default content
             Apply profile  Products.CMFPlone:plone-content
             ...

2. How to translate strings?

   .. code:: rst

      .. code:: robotframework

         *** Test Cases ***

         Do something with translated strings
             ${my_variable} =  Translate  my_msgid
             ...   default=Default string for the translation
             ...

3. How to create and log in a user?

   .. code:: rst

      .. code:: robotframework

         *** Test Cases ***

         Do something as a new user
             ${user_id} =  Translate  user_id  default=jane-doe
             ${user_fullname} =  Translate  user_fullname  default=Jane Doe
             Create user  ${user_id}  Member  fullname=${user_fullname}
             Set autologin username  ${user_id}
             ...


4. How to logout back to anonymous user?

   .. code:: rst

      .. code:: robotframework

         *** Test Cases ***

         Do something as anonymous user
             Disable autologin
             ...

5. How to create sample content?

   .. code:: rst

      .. code:: robotframework

         *** Test Cases ***

         Create sample content
             ${folder_id} =  Translate  folder_news_id  default=news
             ${folder_title} =  Translate  folder_news_title  default=News
             ${container} =  Create content  type=Folder
             ...   id=${folder_id}  title=${folder_title}

             ${item_id} =  Translate  sample_news_id
             ...   default=website-refresh
             ${item_title} =  Translate  sample_news_title
             ...   default=Welcome to our new site!
             ${item_description} =  Translate  sample_news_description
             ...   default=The long wait is now over
             ${item_text} =  Translate  sample_news_text
             ...   default=<p>Our new site is built with Plone.</p>

             ${item} =  Create content  container=${container}  type=News Item
             ...   id=${item_id}  title=${item_title}
             ...   description=${item_description}  text=${item_text}
             Do workflow action for  ${item}  publish

   **NOTE:** Sample content is always created as the currently logged-in
   user (and cannot be created as anonymous user or as an user without enough
   permissions).

6. Where should I define custom keywords?

   In the same document, within any ``.. code:: robotframework``-directive.
   Shared keywords can be defined in
   ``./src/collective/usermanual/keywords.robot``.

7. How do I use i18n strings?

   Translate msgid into test level variable with
   ``${msg} =  Translate  msgidname default=Default translation"``
   and use that translated variable where localized string is required.

   Update gettext-catalogs by running ``make babel``.

   Select build default language by setting environment variable
   ``LANGUAGE`` with your locale, e.g. ``LANGUAGE=fi make clean robot``.

8. How to activate custom product?

   See usage of variables *CONFIGURE_PACKAGES* and *APPLY_PROFILES* (also
   *META_PACKAGES*, *OVERRIDE_PACKAGES* and *INSTALL_PACKAGES* are
   available):

   https://raw.github.com/collective/collective.usermanual/robot-screenshots/source/managing-content/working-copy.rst

   **NOTE**: These variables only work when document is built in *standalone*
   mode. With *robot-server*-mode these can be set only once for all documents
   with environment variables when starting *robot-server*. See Makefile for
   examples.


Multilingual demo
-----------------

This demo provides raw-material for http://www.youtube.com/watch?v=VN9FROZO5AY.

.. code:: rst

   .. include:: source/robot.rst

   .. code:: robotframework
      :class: hidden

      *** Variables ***

      @{LOCALES}  af  ar  bg  bn  ca  cs  cy  da  de  el  en  eo  es  et  eu  fa  fi  fr  gl  he  hi  hr  hu  hy  id  it  ja  ka  kn  ko  lt  lv  mk_MK  nl  nn  no  pl  pt  pt_BR  ro  ru  sk  sl  sq  sr  sv  ta  te  th  tr  uk  vi  zh_CN  zh_HK  zh_TW

      *** Test Cases ***

      Show front page
          Set window size  854  1024
          :FOR  ${locale}  IN  @{LOCALES}
          \  Show front page  ${locale}

      *** Keywords ***

      Show front page
          [Arguments]  ${locale}
          Set default language  ${locale}
          Apply profile  Products.CMFPlone:plone-content
          Go to  ${PLONE_URL}

          Test teardown
          Test setup

