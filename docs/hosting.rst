=======
Hosting
=======

Server
======

The server is configured and setup via Ansible. All changes are done via Ansible, too, there is no need to login to do anything.

Container
=========

There a number of containers running on the host:

- plone/docs5 [docs for Plone 5]
- plone/docs4 [docs for Plone 4]
- plone/docs3 [docs for Plone 3]
- portainer/portainer [for people who do not like command-line]

Maybe later to add there are currently not existing or/and out of scope:

- plone/training-landing
- plone/training-diazo
- plone/training-hosting
- plone/training-solr
- plone/training-mastering
- ...
- plone/planet
- plone/community

Nginx is currently not running in a container, but 'bare bone' on the host, changes and config are done via Ansible.
