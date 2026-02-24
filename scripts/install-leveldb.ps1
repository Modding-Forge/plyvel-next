$LEVELDB_VERSION="1.23"

# Check env
if (-not (Test-Path env:CIBW_ARCHS_WINDOWS)) { $env:CIBW_ARCHS_WINDOWS = "AMD64" }
if ($env:CIBW_ARCHS_WINDOWS -eq "x86") {
    $arch="Win32"
} elseif ($env:CIBW_ARCHS_WINDOWS -eq "AMD64") {
    $arch="x64"
} else {
    $arch=""
    Write-Output "not support arch $env:CIBW_ARCHS_WINDOWS"
    exit
}

$generators = @("Visual Studio 17 2022", "Visual Studio 16 2019")


# Prepare leveldb source code
$url="https://codeload.github.com/google/leveldb/tar.gz/$LEVELDB_VERSION"
$repo="C:\opt"
$output="leveldb.tar.gz"

mkdir $repo -ea 0; Set-Location $repo
Invoke-WebRequest -Uri $url -OutFile $output
tar -xzf $output
Set-Location leveldb-*

# Compile leveldb
$INSTALL_PREFIX="C:\local"
$INCLUDE="$INSTALL_PREFIX\include"
$LIB="$INSTALL_PREFIX\lib"
# $PATH="$INSTALL_PREFIX\bin"

$env:CL="/I$INCLUDE" # where find snappy header files
$env:LINK="/LIBPATH:$LIB" # where find snappy library files

mkdir build -ea 0; Set-Location build
$configured = $false
foreach ($generator in $generators) {
    if (Test-Path "CMakeCache.txt") { Remove-Item "CMakeCache.txt" -Force }
    cmake -G $generator -A $arch `
        -DCMAKE_INSTALL_PREFIX="$INSTALL_PREFIX" `
        -DBUILD_SHARED_LIBS=ON `
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON `
        -DLEVELDB_BUILD_TESTS=OFF `
        -DLEVELDB_BUILD_BENCHMARKS=OFF `
        ..
    if ($LASTEXITCODE -eq 0) {
        $configured = $true
        break
    }
}

if (-not $configured) {
    Write-Output "Failed to configure leveldb with all known generators"
    exit 1
}

cmake --build . --target install --config Release
