if (WIN32)
    find_program(castxml_EXECUTABLE NAMES castxml PATHS ${castxml_DIR}/castxml-windows/castxml/bin NO_DEFAULT_PATH)
else()
    find_program(castxml_EXECUTABLE NAMES castxml PATHS ${castxml_DIR}/castxml-linux/castxml/bin NO_DEFAULT_PATH)
endif()

if(EXISTS "${castxml_EXECUTABLE}")
else()
    message(FATAL_ERROR "castxml_EXECUTABLE not found")
endif()

add_executable(castxml IMPORTED)
set_target_properties(castxml PROPERTIES
        IMPORTED_LOCATION_RELEASE        ${castxml_EXECUTABLE}
        IMPORTED_LOCATION_DEBUG          ${castxml_EXECUTABLE}
        IMPORTED_LOCATION_MINSIZEREL     ${castxml_EXECUTABLE}
        IMPORTED_LOCATION_RELWITHDEBINFO ${castxml_EXECUTABLE})
