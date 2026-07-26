$SNAPPY_VERSION="1.2.1"

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


# Prepare snappy source code
$url="https://codeload.github.com/google/snappy/tar.gz/$SNAPPY_VERSION"
$repo="C:\opt"
$output="snappy.tar.gz"

mkdir $repo -ea 0; Set-Location $repo
Invoke-WebRequest -Uri $url -OutFile $output
tar -xzf $output
Set-Location snappy-*

# Compile snappy
$INSTALL_PREFIX="C:\local"

mkdir build -ea 0; Set-Location build
$configured = $false
foreach ($generator in $generators) {
    if (Test-Path "CMakeCache.txt") { Remove-Item "CMakeCache.txt" -Force }
    cmake -G $generator -A $arch `
        -DCMAKE_INSTALL_PREFIX="$INSTALL_PREFIX" `
        "-DCMAKE_POLICY_VERSION_MINIMUM=3.5" `
        -DBUILD_SHARED_LIBS=ON `
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON `
        -DSNAPPY_BUILD_BENCHMARKS=OFF `
        -DSNAPPY_BUILD_TESTS=OFF `
        -DSNAPPY_HAVE_BMI2=OFF `
        ..
    if ($LASTEXITCODE -eq 0) {
        $configured = $true
        break
    }
}

if (-not $configured) {
    Write-Output "Failed to configure snappy with all known generators"
    exit 1
}

cmake --build . --target install --config Release
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
