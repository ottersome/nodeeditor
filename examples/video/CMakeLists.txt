file(GLOB_RECURSE CPPS  ./*.cpp )

add_executable(video ${CPPS})

target_link_libraries(video nodes)
