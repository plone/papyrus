=====
Steps
=====

*Before* you start with the release process, first gather some data for our statistics, how we are doing.
- run linkcheck
- run spell check
- add results to :doc:`stats.rst`.

.. code-block:: shell

    typos: $number_of_typos
    broken links: $number_of_broken_links


- update or do fresh checkouts of `papyrus <https://github.com/plone/papyrus>`_ branches
- check ga settings in theme

.. code-block:: bash

    cd /home/svx/Projects/PloneDocs
    git clone https://github.com/plone/papyrus.git plone5

    cd plone5
    make html

- tag commit with release, that makes the changelog easier
- check who did the most commits send prs
- upload created static html to vagrant test box
- write changelog
- write down nr of typos and not working links
- new pull request for dash user-contributions
- sync new docsets and html to 5.docs.plone.org
- announce new version via twitter account and on community
