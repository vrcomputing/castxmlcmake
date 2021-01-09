# CastXML CMake Packaging

This project downloads the binaries of [CastXML](https://github.com/CastXML/CastXML) version 0.3.6 which are built by [CastXMLSuperbuild](https://github.com/CastXML/CastXMLSuperbuild) and hosted by [kitware.com](https://data.kitware.com/#folder/57b5de948d777f10f2696370) and adds CMake package scripts next to it in order to create a [CMake Package](https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html).

# Packaging

```bat
rem example for using MSBuild + Visual Studio 2017 x64
cmake -G "Visual Studio 15 2017" -A x64 -DCMAKE_INSTALL_PREFIX:PATH=G:\repositories\CastXMLCMake\install -S G:\repositories\CastXMLCMake -B G:\repositories\CastXMLCMake\build
cmake --build g:/repositories/CastXMLCMake/build --config Release --target install
```

# Usage

Define the variable *castxml_DIR* before executing the *find_package(...)* for castxml

```cmake
find_package(castxml 0.3.6 REQUIRED)
```