cmake_minimum_required(VERSION 3.5)
project(ska)

add_library(ska INTERFACE) 
target_include_directories(ska INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}> $<INSTALL_INTERFACE:include>)

install(TARGETS ska EXPORT ska-targets)
install(EXPORT ska-targets FILE ska-targets.cmake NAMESPACE stk:: DESTINATION share/ska)
