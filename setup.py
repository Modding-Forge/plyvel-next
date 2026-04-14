import platform

from Cython.Build import cythonize
from setuptools import setup
from setuptools.extension import Extension

include_dirs: list[str] = []
library_dirs: list[str] = []

# -fno-rtti: fixes missing typeinfo symbol when linking against leveldb 1.23,
# which itself is compiled without RTTI.
if platform.system() == "Windows":
    extra_compile_args = ["/std:c++17"]
    include_dirs = ["C:/local/include"]
    library_dirs = ["C:/local/lib"]
else:
    extra_compile_args = ["-Wall", "-g", "-x", "c++", "-std=c++11", "-fno-rtti"]
    if platform.system() == "Darwin":
        extra_compile_args += ["-stdlib=libc++"]

ext_modules = [
    Extension(
        "plyvel_next._plyvel",
        language="c++",
        sources=["plyvel_next/_plyvel_next.pyx", "plyvel_next/comparator.cpp"],
        libraries=["leveldb"],
        extra_compile_args=extra_compile_args,
        include_dirs=include_dirs,
        library_dirs=library_dirs,
    ),
]

setup(ext_modules=cythonize(ext_modules, build_dir="build"))

