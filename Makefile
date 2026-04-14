.PHONY: all cython ext doc clean test docker-build-env release

all: cython ext

cython:
	cython --version
	cython --cplus --fast-fail --annotate plyvel_next/_plyvel.pyx

ext: cython
	uv run python setup.py build_ext --inplace --force

doc:
	uv run sphinx-build -W -b html doc doc/build/html
	@echo
	@echo Generated documentation: "file://"$$(readlink -f doc/build/html/index.html)
	@echo

clean:
	$(RM) plyvel_next/_plyvel.cpp plyvel_next/_plyvel*.so
	$(RM) -r build/ testdb/
	$(RM) -r doc/build/
	$(RM) -r plyvel_next.egg-info/
	find . -name '*.py[co]' -delete
	find . -name __pycache__ -delete

test: ext
	uv run python -m pytest

docker-build-env:
	docker build -t plyvel-build .

release: docker-build-env
	CIBW_BUILD='cp3*-manylinux_x86_64' \
	CIBW_SKIP='cp36-manylinux_x86_64' \
	CIBW_MANYLINUX_X86_64_IMAGE=plyvel-build \
	CIBW_BEFORE_BUILD=scripts/cibuildwheel-before-build.sh \
	CIBW_PLATFORM=linux \
	cibuildwheel --output-dir dist
