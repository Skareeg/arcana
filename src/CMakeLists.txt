cmake_minimum_required(VERSION 3.30)

project(Arcana LANGUAGES C)

find_package(Vulkan REQUIRED)

# Add the includes.
include_directories(${Vulkan_INCLUDE_DIRS})

# Create the executable.
add_executable(Arcana arcana.c)

# Link.
target_link_libraries(Arcana ${Vulkan_LIBRARIES})