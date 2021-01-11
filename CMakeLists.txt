cmake_minimum_required(VERSION 3.10)

# download and package CastXML v0.3.6
project(CastXMLCMake)

function(download_file url filename hash_type hash)
    if(NOT EXISTS ${filename})
    file(DOWNLOAD ${url} ${filename}
        TIMEOUT 60 # seconds
        EXPECTED_HASH ${hash_type}=${hash}
        TLS_VERIFY ON)
    endif()
endfunction(download_file)

if (WIN32)	

    # download castxml-windows
    download_file(
        https://data.kitware.com/api/v1/file/5f6c9cd150a41e3d19a8e7b9/download?contentDisposition=inline
        ${CMAKE_BINARY_DIR}/castxml-windows.zip
        SHA512 ed396ebd56301a4dd4c414a02f8c41293d1ed60df0802ccf4eb1f6db63bdf7d2ddea0eb66cc5ce1e1fd244e29d446072eae9fbe9f13159fb0213772a796a10eb)

    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/castxml-windows)

    # extract archive
    execute_process(COMMAND ${CMAKE_COMMAND} -E tar xvf "${CMAKE_BINARY_DIR}/castxml-windows.zip" WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/castxml-windows")

    # install the archive's files
    install(DIRECTORY ${CMAKE_BINARY_DIR}/castxml-windows DESTINATION castxml)
    
else()

    # download castxml-linux
    download_file(
        https://data.kitware.com/api/v1/file/5f6c9d2650a41e3d19a8e7ec/download?contentDisposition=inline
        ${CMAKE_BINARY_DIR}/castxml-linux.tar.gz
        SHA512 85514042f024c705ea9647b4830ac5e58c83167792c2cfe9edab6ea4af52b0f8cb967ff53c5bfee6f8d6096f4de6a83c95d67c538f6fc0c537bc596948817585)

    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/castxml-linux)

    # extract archive
    execute_process(COMMAND ${CMAKE_COMMAND} -E tar xvf "${CMAKE_BINARY_DIR}/castxml-linux.tar.gz" WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/castxml-linux")

    # install the archive's files
    install(DIRECTORY ${CMAKE_BINARY_DIR}/castxml-linux DESTINATION castxml)
endif()

add_subdirectory(cmake)