cmake_minimum_required(VERSION 3.15)
project(Trabalho2 C)

set(CMAKE_C_STANDARD 11)

add_executable(pthreads_dotprod1 pthreads_dotprod/pthreads_dotprod.c)
add_executable(pthreads_dotprod2 pthreads_dotprod/pthreads_dotprod2.c)
add_executable(openmp openmp/ompsimple.c)

set_target_properties(pthreads_dotprod1 PROPERTIES LINK_FLAGS " --static")
set_target_properties(pthreads_dotprod2 PROPERTIES LINK_FLAGS " --static")

if (WIN32)
    add_custom_command(TARGET openmp POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${PROJECT_SOURCE_DIR}/libs"
            $<TARGET_FILE_DIR:openmp>)
endif()

find_package(Threads REQUIRED)
find_package(OpenMP REQUIRED)

target_link_libraries(pthreads_dotprod1 ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(pthreads_dotprod2 ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(openmp PUBLIC OpenMP::OpenMP_C)