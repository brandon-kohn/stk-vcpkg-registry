vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/poly2tri
    REF 868184da34a5bc7dadd40d1643bb03913678186a
    SHA512 db2cc5b4f6376c917c9d1fbf7498d755236f30f1ff794831e43642bdf8333c303250d08c083a928a3a6fd31326368af73e4d9646d264ce97aa9da5900ccf248e
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/poly2tri)

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/poly2tri-config.in.cmake
    ${CURRENT_PACKAGES_DIR}/share/poly2tri/poly2tri-config.cmake
    @ONLY
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cmake" "${CURRENT_PACKAGES_DIR}/testbed/data")
file(GLOB HEADER_FILES ${SOURCE_PATH}/poly2tri/*)
file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/${PORT})
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
