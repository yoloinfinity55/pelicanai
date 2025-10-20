VENV=../venv/bin/activate
CONTENT_DIR=content
OUTPUT_DIR=output
PELICAN=pelican

.PHONY: help build-css build build-prod clean serve dev install deploy

help:
	@echo "Commands: install, build-css, build, build-prod, clean, serve, dev, deploy"

install:
	cd .. && python3 -m venv venv
	. $(VENV) && python -m pip install --upgrade pip
	. $(VENV) && pip install "pelican[markdown]" typogrify
	npm install

build-css:
	npx --yes @tailwindcss/cli@4.0.0-beta.4 -i input.css -o theme/theme-dark/static/css/tailwind.css --minify

build: build-css
	. $(VENV) && $(PELICAN) $(CONTENT_DIR) -s pelicanconf.py

build-prod: build-css
	. $(VENV) && $(PELICAN) $(CONTENT_DIR) -s publishconf.py

clean:
	rm -rf $(OUTPUT_DIR)

serve:
	. $(VENV) && cd $(OUTPUT_DIR) && python3 -m http.server 8000

dev:
	@echo "Starting development server..."
	@echo "Visit http://localhost:8000"
	npx concurrently \
		"npx chokidar '$(CONTENT_DIR)/**/*.md' 'pelicanconf.py' -c 'make build'" \
		"npx chokidar 'input.css' 'theme/**/*.html' -c 'make build-css && . $(VENV) && $(PELICAN) $(CONTENT_DIR) -s pelicanconf.py'" \
		"make serve"

deploy: build-prod
	@echo "Deploying to GitHub Pages..."
	@echo "Push to main branch to trigger automatic deployment via GitHub Actions"
	git add -A
	git commit -m "Deploy: $$(date +'%Y-%m-%d %H:%M:%S')" || true
	git push origin main
