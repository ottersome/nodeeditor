# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ottersome/Projects/ITRI/nodeeditor

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ottersome/Projects/ITRI/nodeeditor/build

# Utility rule file for connection_colors_autogen.

# Include the progress variables for this target.
include examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/progress.make

examples/connection_colors/CMakeFiles/connection_colors_autogen:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC for target connection_colors"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/cmake -E cmake_autogen /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/AutogenInfo.json Debug

connection_colors_autogen: examples/connection_colors/CMakeFiles/connection_colors_autogen
connection_colors_autogen: examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/build.make

.PHONY : connection_colors_autogen

# Rule to build all files generated by this target.
examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/build: connection_colors_autogen

.PHONY : examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/build

examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/clean:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && $(CMAKE_COMMAND) -P CMakeFiles/connection_colors_autogen.dir/cmake_clean.cmake
.PHONY : examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/clean

examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/depend:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ottersome/Projects/ITRI/nodeeditor /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors /home/ottersome/Projects/ITRI/nodeeditor/build /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/connection_colors/CMakeFiles/connection_colors_autogen.dir/depend

