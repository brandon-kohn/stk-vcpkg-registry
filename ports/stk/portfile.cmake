vcpkg_from_github( OUT_SOURCE_PATH SOURCE_PATH 
    REPO brandon-kohn/simulation_toolkit 
    REF 69389e67a7202e865750e0da24dc1f32d9fcde62 
    SHA512 467a0ce59cb5f2720d05be99c766d35c347bb77fbee9e20600217d0508a0aa0d87fd318757b7ddd4379929448b9b0549b6c632ec2a83c9fd4c9c7e92d52c3aa7 
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

#vcpkg_cmake_configure( SOURCE_PATH "${SOURCE_PATH}" PREFER_NINJA)
#vcpkg_cmake_install()
#vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

#file(GLOB HEADER_FILES ${SOURCE_PATH}/stk/stk/*)
file(INSTALL ${SOURCE_PATH}/stk/stk/version.hpp DESTINATION ${CURRENT_PACKAGES_DIR}/include/stk RENAME version)
file(INSTALL ${SOURCE_PATH}/stk/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
