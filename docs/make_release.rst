Steps
=====

*Before* you start with the release process, first gather some data for our statistics, how we are doing.
- run linkcheck
- run spell check
- add results to *stats.rst*

.. code-block:: bash

    typos: $number_of_typos
    broken links: $number_of_broken_links


- check trello board to make sure all updates/changes for *$release* are done
- have a fresh/clean setup of `our vagrant box <https://github.com/leftxs/vagrant.docs.plone.org>`_ .
- update or do fresh checkouts of `papyrus <https://github.com/plone/papyrus>`_ branches
- check ga settings in theme

.. code-block:: bash

    cd /home/svx/Projects/PloneDocs
    git clone https://github.com/plone/papyrus.git plone5

    cd plone5
    make html

- tag commit with release, that makes the changelog easier
- check who did the most commits send prs
- build dash docset [docs are still in progress]
- build zeal docset [docs are still missing]
- upload created static html to vagrant test box
- upload dash and zeal docsets to vagrant test box
- test new docs with local vagrant test box
- test new docsets with osx/linux
- shutdown vagrant test box
- write changelog
- write down nr of typos and not working links
- new pull request for dash user-contributions
- sync new docsets and html to docs.plone.org
- announce new version via twitter account and on community


To make this easy, just use mr.publisher [tbc]

Question/Todo
-------------

- sync files via vagrant share to vagrant test box, with this we do not have to copy, this saves us
  some time.
- use only selfhosted dash and zeal
- changelog yes/no if so where to put
