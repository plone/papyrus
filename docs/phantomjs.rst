Using phantomjs
===============

Currently (status: 2015-10-17) generating screenshots using `phantomjs <http://phantomjs.org/>`_ works, but is not standardly enabled.

- for now, it is only tested against phantomjs 1.9.8, as there are build issues with 2.0 on Linux and OSX Yosemite
- installing phantomjs is either platform-dependent, or uses an extra software stack (npm), so adds to the difficulty of getting papyrus to run

So for now, it is only optional, and you will have to install phantomjs using your own OS or npm toolchain.
Run "make screenshots-phantomjs" to use phantomjs.

*NOTE: not all tests/screenshots are fully updated for phantomjs yet.
Since execution speed is much faster, we will need to add more conditions like "Wait Until Page Contains  xxx" to ensure stable tests. This affects mainly the 'collaboration' section at the moment (2015-10-17)*

The default remains to use Firefox.
