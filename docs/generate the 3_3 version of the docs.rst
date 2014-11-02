Generate the 3.3 version of the docs
====================================

To generate the 3.3 version of the Plone docs, this is the recommended way on a Linux system:

- mkdir 3.3
- cd 3.3
- git clone https://github.com/plone/papyrus.git  (or use git: if you prefer)
- virtualenv --no-site-packages papyrus
- cd papyrus
- ./bin/python bootstrap.py
- git checkout 3.3
- bin/buildout
- make externals
- make html
