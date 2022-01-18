vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/simulation_toolkit
    REF f74b36fbc7d606fa51d754edf26a1f4d8afa0d35
    SHA512 d42cefdc749c716873b96fff236bf58384adadadb8008ab07b872414888a6601232a00d2276c8eb906da1b1de0f96ee9a9c363776fab739490f6bc4f35846c75
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH share/ska)


file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/stk-ska-config.in.cmake
    ${CURRENT_PACKAGES_DIR}/share/stk-ska/stk-ska-config.cmake
    @ONLY
)
file(GLOB HEADER_FILES ${SOURCE_PATH}/ska/ska/*)
file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/ska)
file(INSTALL ${SOURCE_PATH}/ska/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
