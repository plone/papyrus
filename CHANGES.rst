Changelog
=========

2017xxx
-------

- Adjust name of theme [svx]
- Include docker docs [svx]

2016xxxx
--------

- pin urllib3 [mauritsvanrees]
- Switch to pip install zc.buildout
- Pull ansible docs from STABLE branch [smcmahon]
- add option to use Chrome, update robotframework versions [polyester]

20160330
--------

- Added Fedora OS and links to Debian,Ubuntu to README [svx]
- Updaded docs about dash (docset building) [svx]
- Fixed broken links [svx]
- Fixed various typos [svx]
- Add own conf for building dash Fix:#84 [svx]
- Disable .po creation and robots for po Fix:#98 [svx]
- Update buildout versions Fix:#96


20151208
--------

- Add plone.testing, which is referenced by plone/documentation. [thet]
- update makefile to have "make robot" provide a full environment with demo content (polyester)
- extended exclude_patterns to not process CHANGES.rst and LICENSE.rst files for contributed externals (polyester)
- create a (separate) logfile when you're doing "make debug" (polyester)
- Added option, to ignore localhost to sphinx config [svx]
- Changed permission of get_externals.sh to make it  [svx]
- fix: externals are respecting the branches of the release  [jensens]

20150518
---------

- Updated documentation about making a release [svx]
- Updated Sphinx to 1.3.1 [polyester]
- Use whole versioning numbers, and enabled language-switcher [polyester]
- Added requirements.txt [svx]
- Fetching README.rst and CHANGES.rst for externals, limit history, warnings [polyester]
- Updated docs about papyrus [svx]
- Added the possibility to include gists straight from github [svx]
- Updated install.rst [polyester]
- Added dash-builder for creating docsets [svx]
