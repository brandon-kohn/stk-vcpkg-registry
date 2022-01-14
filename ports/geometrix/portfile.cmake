vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/geometrix
    REF d3d4e56a0f44ececda3b26627135b949351f57e8
    SHA512 ee6b40c21032c3821ae017fe87d5b0d09d53fe7669c6ee2ad24e0d2e2b80a53f9307727e1c502e6fd089c684c1a4fbae8cb5c45b899a94992ce2ba9b3cdd0079
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/geometrix-config.in.cmake
    ${CURRENT_PACKAGES_DIR}/share/geometrix/geometrix-config.cmake
    @ONLY
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

file(GLOB HEADER_FILES ${SOURCE_PATH}/geometrix/*)
file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/${PORT})
file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
