.PHONY: build build-tokens build-scss dist clean

build: clean dist build-tokens build-scss
	mkdir -p dist/images/
	cp *.svg *.png *.ico dist/images/
	cp -r paragon/build paragon/images paragon/fonts dist/paragon/

dist:
	mkdir -p dist/paragon

build-tokens:
	./node_modules/.bin/paragon build-tokens --source ./paragon/tokens/ --build-dir ./paragon/build -t light

build-scss: dist
	./node_modules/.bin/paragon build-scss --corePath ./paragon/core.scss --themesPath ./paragon/build/themes --source

clean:
	rm -rf dist paragon/build