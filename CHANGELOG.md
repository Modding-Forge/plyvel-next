# Changelog

## plyvel-next 2.1.0

- Rename package to `plyvel-next` (previously `plyvel-ci`); import as
  `plyvel_next`.
- Migrate project tooling to uv (`pyproject.toml` fully self-contained,
  `uv.lock` included).
- Replace `README.rst` with `README.md`; add platform support table and
  About Modding Forge section; replace inline Changelog with link to
  `CHANGELOG.md`.
- Convert `LICENSE.rst` to plain `LICENSE` (BSD 3-Clause); add MIT notice
  for Modding Forge modifications since commit
  `e10f4c329aabe4d9e2b596ef0727a018fdc37db7`.
- Convert `NEWS.rst` to `CHANGELOG.md`.
- Update LevelDB 1.23 to 1.24 in install scripts.
- Update Snappy 1.1.9 to 1.2.1 in install scripts; remove no-longer-needed
  inline patch.
- Modernize `Makefile`: fix paths to `plyvel_next/`, replace deprecated
  `setup.py build_sphinx` with `sphinx-build`, replace `setup.py clean` with
  direct `$(RM)` calls.
- Update `.readthedocs.yaml` to spec version 2.1 and `ubuntu-24.04`.
- Remove obsolete files: `.travis.yml`, `tox.ini`, `TODO.rst`,
  `cibuildwheel.yml`.
- Rename default branch from `CI` to `master`.
- Update `pyproject.toml` metadata: dual license `BSD-3-Clause AND MIT`,
  Modding Forge as maintainer, homepage `moddingforge.com`, GitHub URLs,
  add Windows and macOS OS classifiers.
- Overhaul publish workflow: split into `publish-pypi` (OIDC Trusted
  Publisher, `uv publish`) and `publish-github` (GitHub Release with sdist
  and wheels); use job-scoped permissions.
- Clean up `.gitignore`: fix `plyvel_next/` paths, add `.pyd`, `htmlcov/`,
  `.pytest_cache/`, `doc/build/`, OS and IDE entries.
- Fix macOS Intel wheel matrix to build for Python 3.12, 3.13, and 3.14.

## Plyvel-next: 2.0.1

- Fix macOS Intel wheel matrix to build for Python 3.12, 3.13, and 3.14.

## plyvel-next 2.0.0

- Add Python 3.13-3.14 support.
- Drop support for Python 3.7-3.11.
- Add separate GitHub release-asset publish workflow.

---

## plyvel-ci 1.5.1

- Fork of [plyvel](https://github.com/wbolster/plyvel) by
  [liviaerxin](https://github.com/liviaerxin), published as `plyvel-ci` on PyPI.
- Add cross-platform CI/CD using cibuildwheel: Linux (manylinux x86_64, aarch64,
  i686), macOS (x86_64, universal2), Windows (x86, AMD64).
- Add GitHub Actions workflow to publish wheels to PyPI and create GitHub Releases.
- Build wheels against LevelDB 1.23 and Snappy 1.1.10.
- Add Python 3.10, 3.11, 3.12 wheel support.
- Use `windows-2019` as build OS for Windows wheels.

---

## plyvel 1.5.1

Release date: 2024-01-15

- Add Python 3.12 support.
- Rebuild Linux wheels, including Python 3.12 wheels.
- Allow using `plyvel.DB` as a context manager
  ([pr #151](https://github.com/wbolster/plyvel/pull/151))

## plyvel 1.5.0

Release date: 2022-10-26

- Rebuild Linux wheels, with `manylinux_2_17` and `manylinux2014` compatibility
  (`x86_64` only). Also produce Python 3.11 wheels. Still using Snappy 1.1.9
  and LevelDB 1.22.
  ([issue #148](https://github.com/wbolster/plyvel/issues/148))

## plyvel 1.4.0

Release date: 2021-12-29

- Build Linux wheels against Snappy 1.1.9, LevelDB 1.22, and produce Python
  3.10 wheels.
  ([issue #138](https://github.com/wbolster/plyvel/issues/138))
- The minimum LevelDB version is now 1.21.
  ([pr #121](https://github.com/wbolster/plyvel/pull/121))
- Add support for `WriteBatch.append()`.
  ([pr #121](https://github.com/wbolster/plyvel/pull/121))
- Add support for `WriteBatch.approximate_size()`.
  ([pr #121](https://github.com/wbolster/plyvel/pull/121))

## plyvel 1.3.0

Release date: 2020-10-10

- Use manylinux2010 instead of manylinux1 to build wheels.
  ([pr #103](https://github.com/wbolster/plyvel/pull/103))
- Add Python 3.9 support.
- Drop Python 3.5 support.
- Completely drop Python 2 support.

## plyvel 1.2.0

Release date: 2020-01-22

- Add Python 3.8 support.
  ([pr #109](https://github.com/wbolster/plyvel/pull/109))
- Drop Python 3.4 support.
  ([pr #109](https://github.com/wbolster/plyvel/pull/109))
- Build Linux wheels against Snappy 1.1.8, LevelDB 1.22, and produce Python
  3.8 wheels.
  ([issue #108](https://github.com/wbolster/plyvel/issues/108),
  [pr #111](https://github.com/wbolster/plyvel/pull/111))
- Improve compilation flags for Darwin (OSX) builds.
  ([pr #107](https://github.com/wbolster/plyvel/pull/107))

## plyvel 1.1.0

Release date: 2019-05-02

- Expose `DB.name` attribute to Python code.
  ([pr #90](https://github.com/wbolster/plyvel/pull/90))
- Fix building sources on OSX.
  ([issue #95](https://github.com/wbolster/plyvel/issues/95),
  [pr #97](https://github.com/wbolster/plyvel/pull/97))
- Build Linux wheels against LevelDB 1.21.

## plyvel 1.0.5

Release date: 2018-07-17

- Rebuild wheels: build against Snappy 1.1.7, and produce Python 3.7 wheels.
  ([issue #78](https://github.com/wbolster/plyvel/issues/78),
  [pr #79](https://github.com/wbolster/plyvel/pull/79))

## plyvel 1.0.4

Release date: 2018-01-17

- Build Python wheels with Snappy compression support.
  ([issue #68](https://github.com/wbolster/plyvel/issues/68))

## plyvel 1.0.3

Release date: 2018-01-16

- Fix building sources on OSX.
  ([issue #66](https://github.com/wbolster/plyvel/issues/66),
  [pr #67](https://github.com/wbolster/plyvel/pull/67))

## plyvel 1.0.2

Release date: 2018-01-12

- Correctly build wide unicode Python 2.7 wheels (cp27-cp27mu, UCS4).
  ([issue #65](https://github.com/wbolster/plyvel/issues/65))

## plyvel 1.0.1

Release date: 2018-01-05

- Provide binary packages (manylinux1 wheels) for Linux. These wheel packages
  have the LevelDB library embedded, making installation easier since they do
  not depend on a recent LevelDB version being installed system-wide.
  ([pr #64](https://github.com/wbolster/plyvel/pull/64),
  [issue #62](https://github.com/wbolster/plyvel/issues/62),
  [issue #63](https://github.com/wbolster/plyvel/issues/63))

## plyvel 1.0.0

Release date: 2018-01-03

- First 1.x release. Switched to semantic versioning.
- Drop support for older Python versions. Minimum versions are now Python 3.4+.
- The minimum LevelDB version is now 1.20.
  ([pr #61](https://github.com/wbolster/plyvel/pull/61))
- The various `.put()` methods now accept any type implementing Python's buffer
  protocol (`bytes`, `bytearray`, `memoryview`). Note: keys must still be
  `bytes`.
  ([issue #52](https://github.com/wbolster/plyvel/issues/52))

## plyvel 0.9

Release date: 2014-08-27

- Ensure that the Python GIL is initialized when a custom comparator is used.
  ([issue #35](https://github.com/wbolster/plyvel/issues/35))

## plyvel 0.8

Release date: 2013-11-29

- Allow snapshots to be closed explicitly using `Snapshot.close()` or a `with`
  block.
  ([issue #21](https://github.com/wbolster/plyvel/issues/21))

## plyvel 0.7

Release date: 2013-11-15

- New raw iterator API that mimics the LevelDB C++ interface. See
  `DB.raw_iterator()` and `RawIterator`.
  ([issue #17](https://github.com/wbolster/plyvel/issues/17))
- Migrate to `pytest` and `tox` for testing.
  ([issue #24](https://github.com/wbolster/plyvel/issues/24))
- Performance improvements in iterator and write batch construction.
- The `fill_cache`, `verify_checksums`, and `sync` arguments are now correctly
  taken into account everywhere.

## plyvel 0.6

Release date: 2013-10-18

- Allow iterators to be closed explicitly using `Iterator.close()` or a `with`
  block.
  ([issue #19](https://github.com/wbolster/plyvel/issues/19))
- Add useful `__repr__()` for `DB` and `PrefixedDB` instances.
  ([issue #16](https://github.com/wbolster/plyvel/issues/16))

## plyvel 0.5

Release date: 2013-09-17

- Fix `Iterator.seek()` for `PrefixedDB` iterators.
  ([issue #15](https://github.com/wbolster/plyvel/issues/15))
- Make some argument type checking a bit stricter.
- Support LRU caches larger than 2 GB.

## plyvel 0.4

Release date: 2013-06-17

- Add optional `default` argument for all `.get()` methods.
  ([issue #11](https://github.com/wbolster/plyvel/issues/11))

## plyvel 0.3

Release date: 2013-06-03

- Fix iterator behaviour for reverse iterators using a prefix.
  ([issue #9](https://github.com/wbolster/plyvel/issues/9))

## plyvel 0.2

Release date: 2013-03-15

- Fix iterator behaviour for iterators using non-existing start or stop keys.
  ([issue #4](https://github.com/wbolster/plyvel/issues/4))

## plyvel 0.1

Release date: 2012-11-26

- Initial release.
