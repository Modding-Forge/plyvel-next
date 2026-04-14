# plyvel-next

**plyvel-next** is a fast and feature-rich Python interface to [LevelDB](https://github.com/google/leveldb).

This project is a fork of [plyvel-ci](https://github.com/liviaerxin/plyvel), which itself is based on the original [plyvel](https://github.com/wbolster/plyvel) by Wouter Bolsterlee. The goal of this fork is to support newer Python versions and publish updated wheels.

---

## Installation

```shell
uv add plyvel-next
```

or

```shell
pip install plyvel-next
```

---

## Usage

```python
import plyvel_next as plyvel

db = plyvel.DB("/tmp/testdb/", create_if_missing=True)
db.put(b"key", b"value")
print(db.get(b"key"))  # b'value'
db.close()
```

---

## Platform Support

| Platform              | Architecture             | Python 3.12 | Python 3.13 | Python 3.14 |
| --------------------- | ------------------------ | ----------- | ----------- | ----------- |
| Linux (manylinux2014) | x86_64                   | yes         | yes         | yes         |
| Linux (manylinux2014) | aarch64                  | yes         | yes         | yes         |
| macOS                 | x86_64 (Intel)           | yes         | yes         | yes         |
| macOS                 | universal2 (ARM + Intel) | yes         | yes         | yes         |
| Windows               | x86                      | yes         | yes         | yes         |
| Windows               | x86_64                   | yes         | yes         | yes         |

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for the full history.

---

## License

Dual licensed: See [LICENSE](LICENSE).

---

## About Modding Forge

**plyvel-next** was made for the Python tooling powering [Modding Forge](https://moddingforge.com) - a community dedicated to Skyrim modding. If you enjoy modding or want to connect with other modders, come say hi!
