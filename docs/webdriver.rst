Installing a webdriver for robotscreenshots
===========================================

To generate the robot-screenshots you will have to set up your browser to work with the selenium/robot framework

Using Firefox
-------------

Until version 45, a webdriver was shipped standard with Firefox.
Since Firefox 46, this is no longer the case, and the situation is in flux at the moment.

A new webdriver called "Marionette" is nearing completion, but you will have to set it up yourself. See `the Mozilla docs <https://developer.mozilla.org/en-US/docs/Mozilla/QA/Marionette/WebDriver>`_ for the latest status.


Using Chrome
------------

The driver for Chrome is currently (state: july 2016) more stable.
You will still have to install it.
See the `ChromeDriver home page <https://sites.google.com/a/chromium.org/chromedriver/>`_ for the latest version, available for Windows, Mac and Linux operating systems.
You will also have to make sure the driver is available on your path.


Using phantomjs
---------------

Currently (status: 2015-10-17) generating screenshots using `phantomjs <http://phantomjs.org/>`_ works, but is not standardly enabled.

- for now, it is only tested against phantomjs 1.9.8, as there are build issues with 2.0 on Linux and OSX Yosemite
- installing phantomjs is either platform-dependent, or uses an extra software stack (npm), so adds to the difficulty of getting papyrus to run

So for now, it is only optional, and you will have to install phantomjs using your own OS or npm toolchain.
Run "make screenshots-phantomjs" to use phantomjs.

*NOTE: not all tests/screenshots are fully updated for phantomjs yet.
Since execution speed is much faster, we will need to add more conditions like "Wait Until Page Contains  xxx" to ensure stable tests. This affects mainly the 'collaboration' section at the moment (2015-10-17)*

