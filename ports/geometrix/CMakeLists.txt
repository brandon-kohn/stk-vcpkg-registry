cmake_minimum_required(VERSION 3.5)
project(geometrix CXX)

add_library(geometrix INTERFACE)

target_include_directories(geometrix INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}> $<INSTALL_INTERFACE:include>)

install(TARGETS geometrix EXPORT geometrix-targets )
install(EXPORT geometrix-targets FILE geometrix-targets.cmake DESTINATION share/geometrix)
