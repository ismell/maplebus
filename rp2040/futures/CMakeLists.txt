add_library(futures INTERFACE)
target_include_directories(futures INTERFACE ${CMAKE_CURRENT_LIST_DIR}/include)
target_sources(futures INTERFACE
        futures.c
)
# target_link_libraries(futures INTERFACE <libs>)