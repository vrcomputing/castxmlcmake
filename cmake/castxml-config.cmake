if(NOT castxml_FOUND)
    get_filename_component(castxml_DIR "${CMAKE_CURRENT_LIST_DIR}" ABSOLUTE)
    include(${castxml_DIR}/castxml-targets.cmake)
endif()
set(castxml_FOUND TRUE)