Debug
=====

When you are working on the docs, and you added, changed or formated pages,
you want to make sure there look OK in html.

For small changes where you just want to see that the formating went well, it
can be enough to use for example `OmniMarkupPreviewer <https://sublime.wbond.net/packages/OmniMarkupPreviewer>`_ this Sublime addon will create html from your rst code.

However on a certain point you really want to check how it will look like on `docs.plone.org <http://docs.plone.org>`_.

If you 'just' worked on text, you do not want to generate all the screen-shots
with robot-framework, because this will take a long time.

You can run::

    make debug

This make function will create the docs, without using robot-framework to test
all screen-shots, it will also use more cpu power of your machine to speed
things up.

At this moment this is only configured to do it for the English documentation,
if you want to have this feature for another languages, please open a ticket or
send a pull request !
