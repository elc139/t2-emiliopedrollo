cmake_minimum_required(VERSION 3.15)
project(Trabalho2 C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_EXE_LINKER_FLAGS "-static")

add_executable(pthreads_dotprod1 pthreads_dotprod/pthreads_dotprod.c)
add_executable(pthreads_dotprod2 pthreads_dotprod/pthreads_dotprod2.c)
add_executable(openmp openmp/ompsimple.c)

find_package(Threads)
find_package(OpenMP)

target_link_libraries(pthreads_dotprod1 ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(pthreads_dotprod2 ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(openmp PUBLIC OpenMP::OpenMP_C)