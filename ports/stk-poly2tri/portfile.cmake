vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/poly2tri
    REF 424ffc5f93523dcd2c933b1ff4da2b52ed029439
    SHA512 7b8ebae4577e6cd3ff53de0ba4041cd657c4230405466f6b005a67f8ac5942d22a67ceb23e24777fff87587b12619c5be518603d1b3aa8784b4749a214513f5d
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/stk-poly2tri)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cmake" "${CURRENT_PACKAGES_DIR}/testbed/data")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
