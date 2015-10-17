# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = bin/sphinx-build
SPHINXINTLBUILD   = bin/sphinx-intl
TX            = bin/tx
PAPER         =

PKGNAME       = documentation
TRANSIFEX_PROJECT_NAME = plone-doc
#LANGS           = en it
LANGS		= en
# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d build/doctrees -c conf $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source/$(PKGNAME)
I18NOPTS        = --pot-dir source/$(PKGNAME)/_locales -c conf

# Robot-server variables
CONFIGURE_PACKAGES = plone.app.contenttypes
APPLY_PROFILES = plone.app.contenttypes:plone-content
ROBOTSERVER_FIXTURE = plone.app.robotframework.PLONE_ROBOT_TESTING
ROBOTSERVER_OPTS = -v

.PHONY: help fast-link-check clean html serve robot babel dirhtml pickle json htmlhelp qthelp latex changes linkcheck doctest pull spellcheck test dash

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html      to make standalone HTML files without screenshots"
	@echo "  screenshot  	to generate the screenshots using robotframework"
	@echo "  screenshots-phantomjs	to generate the screenshots using robotframework and the phantomjs browser, which needs to be available on your path"
	@echo "	 full       to create a full, fresh build including screenshots"
	@echo "  pullall    to refresh and update all external repositories"
	@echo "  dirhtml   to make HTML files named index.html in directories"
	@echo "  pickle    to make pickle files"
	@echo "  gettext   to make i18n messages files"
	@echo "  transifex-init to register new resources in transifex"
	@echo "  transifex-push to push gettext strings to Transifex"
	@echo "  transifex-pull to pull gettext strings from Transifex"
	@echo "  json      to make JSON files"
	@echo "  htmlhelp  to make HTML files and a HTML help project"
	@echo "  qthelp    to make HTML files and a qthelp project"
	@echo "  latex     to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  changes   to make an overview of all changed/added/deprecated items"
	@echo "  linkcheck to check all external links for integrity"
	@echo "  doctest   to run all doctests embedded in the documentation (if enabled)"
	@echo "  spellcheck   to run the enchant spellchecker on all sourcefiles"
	@echo "  debug        to run a 'quick' html build without robot-framework"
	@echo "  clean        to clean build dirs"
	@echo "  test         to run linkcheck and spellcheck"
	@echo "  changes      to get an overview what changed"
	@echo "	 dash	      to create a docset"
	@echo "  fast-link-check to check links without robot-framework"

pull:
	-bin/develop update $(PKGNAME)

pullall:
	-bin/develop update *

externals:
	@echo
	@echo "externals is deprecated, they are fetched at buildout time already"
	@echo "use pullall instead id you want to update"
	-bin/develop update *

full: clean screenshots html


clean:
	-rm -rf build/*
	-rm -rf source/$(PKGNAME)/_robot/*.png

html: $(foreach lang,$(LANGS),html-$(lang))

html-%: $(SPHINX_DEPENDENCIES)
	LANGUAGE=$* $(SPHINXBUILD) -b html -w log/sphinx-build.log -D language=$* -D sphinxcontrib_robotframework_enabled=0 $(ALLSPHINXOPTS) build/html/$*
	@echo
	@echo "Build finished. The HTML pages are in build/html."

screenshots:
	bin/pybot  --exclude wip-* --listener plone.app.robotframework.server.LazyStop source
	@echo
	@echo "Screenshot generation finished"

screenshots-phantomjs:
	bin/pybot  --variable BROWSER:phantomjs --exclude wip-* --listener plone.app.robotframework.server.LazyStop source
	@echo
	@echo "Screenshot generation finished"

gettext:
	$(SPHINXBUILD) -b gettext -c conf -D copyright="The Plone Foundation" source/$(PKGNAME) source/$(PKGNAME)/_locales
	@echo
	@echo "Build finished. The HTML pages are in build/gettext."

transifex-init: $(foreach lang,$(LANGS),transifex-init-$(lang))
transifex-init-%:
	$(SPHINXINTLBUILD) update-txconfig-resources $(I18NOPTS) -l $* --transifex-project-name $(TRANSIFEX_PROJECT_NAME)
	$(SPHINXINTLBUILD) update $(I18NOPTS) -l $*

robot-pot: babel

serve:
	CONFIGURE_PACKAGES=$(CONFIGURE_PACKAGES) APPLY_PROFILES=$(APPLY_PROFILES) bin/robot-server $(ROBOTSERVER_FIXTURE) $(ROBOTSERVER_OPTS)

robot:
	LANGUAGE=en bin/robot-sphinx -b html -D language=en $(ALLSPHINXOPTS) build/html/en
	@echo
	@echo "Build finished. The HTML pages are in build/html."

babel:
	bin/pybabel extract source/$(PKGNAME) -o source/$(PKGNAME)/_locales/pot/plone.pot
	bin/i18ndude sync --pot source/$(PKGNAME)/_locales/pot/plone.pot source/$(PKGNAME)/_locales/*/LC_MESSAGES/plone.po

transifex-push:
	$(TX) push -s

transifex-pull: $(foreach lang,$(LANGS),transifex-pull-$(lang))
transifex-pull-%:
	$(TX) pull -l $*
	$(SPHINXINTLBUILD) $(I18NOPTS) -l $* build
	@echo
	@echo "Build finished. The HTML pages are in build/html."

dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) build/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in build/dirhtml."

pickle:
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) build/pickle
	@echo
	@echo "Build finished; now you can process the pickle files."

json:
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) build/json
	@echo
	@echo "Build finished; now you can process the JSON files."

htmlhelp:
	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) build/htmlhelp
	@echo
	@echo "Build finished; now you can run HTML Help Workshop with the" \
	      ".hhp project file in build/htmlhelp."

qthelp:
	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) build/qthelp
	@echo
	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
	      ".qhcp project file in build/qthelp, like this:"
	@echo "# qcollectiongenerator build/qthelp/PloneDeveloperManual.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile build/qthelp/PloneDeveloperManual.qhc"

latex:
	$(SPHINXBUILD) -w log/sphinx-latex.log -b latex $(ALLSPHINXOPTS)  build/latex
	@echo
	@echo "Build finished; the LaTeX files are in build/latex."
	@echo "Run \`make all-pdf' or \`make all-ps' in that directory to" \
	      "run these through (pdf)latex."

changes:
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) build/changes
	@echo
	@echo "The overview file is in build/changes."

linkcheck:
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) build/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in build/linkcheck/output.txt."

fast-link-check:
	$(SPHINXBUILD) -b linkcheck -D sphinxcontrib_robotframework_enabled=0 -j 4 $(ALLSPHINXOPTS) build/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	    	"or in build/linkcheck/output.txt."

doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) build/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in build/doctest/output.txt."

epub:
	$(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) build/epub
	@echo
	@echo "Build finished. The e-Pub pages are in build/epub."

spellcheck:
	LANGUAGE=$* $(SPHINXBUILD) -b spelling -D sphinxcontrib_robotframework_enabled=0 -D language=$* $(ALLSPHINXOPTS) build/spell/$*
	@echo
	@echo "Spellcheck is finished; look for any errors in the above output " \
              " or in build/spell/output.txt."

debug:
	$(SPHINXBUILD) -b html -D sphinxcontrib_robotframework_enabled=0 -j 4 $(ALLSPHINXOPTS) -w log/sphinx-debug.log build/html/en
	@echo
	@echo " Running debug build "

dash:
	$(SPHINXBUILD) -b dash -j 4 $(ALLSPHINXOPTS) build/dash/

test:	linkcheck spellcheck
	@echo
	@echo " link- and spellcheck is finished, for results please " \
	      " check build/linkcheck/output.txt and build/spell/output.txt"
