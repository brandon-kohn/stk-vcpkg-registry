cmake_minimum_required(VERSION 3.5)
project(stk_core)

add_library(stk INTERFACE) 
add_library(stk-headers ALIAS stk)
add_library(stk::core ALIAS stk)
target_include_directories(stk INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}> $<INSTALL_INTERFACE:include>)

install(TARGETS stk EXPORT stk-targets)
install(EXPORT stk-targets FILE stk-targets.cmake NAMESPACE stk:: DESTINATION share/stk)
