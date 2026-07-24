.PHONY: build build-tokens build-scss dist clean

build: clean dist build-tokens build-scss
	mkdir -p dist/fonts
	mkdir -p dist/images

	cp -r paragon/build dist/build
	cp -r paragon/fonts/* dist/fonts/
	cp -r paragon/images/* dist/images/

	cp *.svg *.png *.ico dist/images/

dist:
	mkdir -p dist/paragon

build-tokens:
	./node_modules/.bin/paragon build-tokens --source ./paragon/tokens/ --build-dir ./paragon/build -t light

build-scss: dist
	./node_modules/.bin/paragon build-scss --corePath ./paragon/core.scss --themesPath ./paragon/build/themes --source

clean:
	rm -rf dist paragon/build