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

# Utility rule file for example2_autogen.

# Include the progress variables for this target.
include examples/example2/CMakeFiles/example2_autogen.dir/progress.make

examples/example2/CMakeFiles/example2_autogen:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC for target example2"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/example2 && /usr/bin/cmake -E cmake_autogen /home/ottersome/Projects/ITRI/nodeeditor/build/examples/example2/CMakeFiles/example2_autogen.dir/AutogenInfo.json Debug

example2_autogen: examples/example2/CMakeFiles/example2_autogen
example2_autogen: examples/example2/CMakeFiles/example2_autogen.dir/build.make

.PHONY : example2_autogen

# Rule to build all files generated by this target.
examples/example2/CMakeFiles/example2_autogen.dir/build: example2_autogen

.PHONY : examples/example2/CMakeFiles/example2_autogen.dir/build

examples/example2/CMakeFiles/example2_autogen.dir/clean:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/example2 && $(CMAKE_COMMAND) -P CMakeFiles/example2_autogen.dir/cmake_clean.cmake
.PHONY : examples/example2/CMakeFiles/example2_autogen.dir/clean

examples/example2/CMakeFiles/example2_autogen.dir/depend:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ottersome/Projects/ITRI/nodeeditor /home/ottersome/Projects/ITRI/nodeeditor/examples/example2 /home/ottersome/Projects/ITRI/nodeeditor/build /home/ottersome/Projects/ITRI/nodeeditor/build/examples/example2 /home/ottersome/Projects/ITRI/nodeeditor/build/examples/example2/CMakeFiles/example2_autogen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/example2/CMakeFiles/example2_autogen.dir/depend

