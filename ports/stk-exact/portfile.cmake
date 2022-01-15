vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/simulation_toolkit
    REF 031961f1b4f076e0205174f5143d1aa13747e830
    SHA512 6e9e3035c52f9ef18de9ee48af75423327dd3f69608d20a820df4c1e0eada38f903c5cf8f8a24675f6480b48699add19ca04c7e1546037e200881242504b116e
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH}/exact)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/exact"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/exact)

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/stk-exact-config.in.cmake
    ${CURRENT_PACKAGES_DIR}/share/stk-exact/stk-exact-config.cmake
    @ONLY
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

#file(GLOB HEADER_FILES ${SOURCE_PATH}/exact/exact/*)
#file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/exact)
file(INSTALL ${SOURCE_PATH}/exact/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
