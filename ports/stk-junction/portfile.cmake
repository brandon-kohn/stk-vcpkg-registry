vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/junction
    REF 43232b0f5892ebfd7a324788051b8b979d625643 
    SHA512 08b77a645166e2eae007caadeb2ab11f89d5591dbd55110f4f30cf43a0962901fc93453526fdcfad0194b180c20a1348a5acc757412969790b20979ad6a7e3f1
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
file(COPY ${CMAKE_CURRENT_LIST_DIR}/Macros.cmake DESTINATION ${SOURCE_PATH}/cmake)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/junction)

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/stk-junction-config.in.cmake
    ${CURRENT_PACKAGES_DIR}/share/stk-junction/stk-junction-config.cmake
    @ONLY
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cmake" "${CURRENT_PACKAGES_DIR}/testbed/data")
#file(GLOB HEADER_FILES ${SOURCE_PATH}/junction/*)
#file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/junction)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
