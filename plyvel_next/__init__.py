"""
Plyvel, a fast and feature-rich Python interface to LevelDB.
"""

import os

_dll_search_paths = []
if os.name == "nt" and hasattr(os, "add_dll_directory"):
    for dll_dir in (os.environ.get("PLYVEL_DLL_DIR"), "C:/local/bin"):
        if dll_dir and os.path.isdir(dll_dir):
            _dll_search_paths.append(os.add_dll_directory(dll_dir))

# Only import the symbols that are part of the public API
from ._plyvel import (  # noqa
    __leveldb_version__,
    DB,
    repair_db,
    destroy_db,
    Error,
    IOError,
    CorruptionError,
    IteratorInvalidError,
)

from ._version import __version__  # noqa
