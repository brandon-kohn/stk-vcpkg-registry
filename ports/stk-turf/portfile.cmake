vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/turf
    REF 873d0b4621edfbc6db8d9413ad55a08f9b2a21d1
    SHA512 6210916e5f242b29b8521c0f00a5518d14cc662386abc12cc366ee214d692ca5fbefa3657db59d450d01f995be942b26f3dcdda8a2f69e00c1d8193419e711d1
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/stk-turf)

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/stk-turf-config.in.cmake
    ${CURRENT_PACKAGES_DIR}/share/stk-turf/stk-turf-config.cmake
    @ONLY
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cmake" "${CURRENT_PACKAGES_DIR}/testbed/data")
#file(GLOB HEADER_FILES ${SOURCE_PATH}/turf/*)# ${CMAKE_CURRENT_BINARY_DIR}/include/turf/*)
#file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/turf)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
