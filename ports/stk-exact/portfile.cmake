vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/simulation_toolkit
    REF f74b36fbc7d606fa51d754edf26a1f4d8afa0d35
    SHA512 d42cefdc749c716873b96fff236bf58384adadadb8008ab07b872414888a6601232a00d2276c8eb906da1b1de0f96ee9a9c363776fab739490f6bc4f35846c75
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH}/exact)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/exact"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/stk-exact)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/exact/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
