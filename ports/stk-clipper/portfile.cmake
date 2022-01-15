vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brandon-kohn/clipper-lib
    REF e5f57114ce29744d827987e26a1fc467cdf4d17f
    SHA512 6f75388ad79d64cf64f91c20f090002fc21dc53a4cea6281b5fe1ef631f55fcacacdb046770e265628ada85e60d7acc99e9783cf6ac8537b50147d813aaed8e7
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/clipper)

configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/stk-clipper-config.in.cmake
    ${CURRENT_PACKAGES_DIR}/share/stk-clipper/stk-clipper-config.cmake
    @ONLY
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cmake" "${CURRENT_PACKAGES_DIR}/testbed/data")
#file(GLOB HEADER_FILES ${SOURCE_PATH}/clipper/*)
#file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/clipper)
file(INSTALL ${SOURCE_PATH}/License.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
