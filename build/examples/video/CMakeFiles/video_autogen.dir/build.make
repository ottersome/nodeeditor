# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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

# Utility rule file for video_autogen.

# Include the progress variables for this target.
include examples/video/CMakeFiles/video_autogen.dir/progress.make

examples/video/CMakeFiles/video_autogen:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC for target video"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/cmake -E cmake_autogen /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video/CMakeFiles/video_autogen.dir/AutogenInfo.json ""

video_autogen: examples/video/CMakeFiles/video_autogen
video_autogen: examples/video/CMakeFiles/video_autogen.dir/build.make

.PHONY : video_autogen

# Rule to build all files generated by this target.
examples/video/CMakeFiles/video_autogen.dir/build: video_autogen

.PHONY : examples/video/CMakeFiles/video_autogen.dir/build

examples/video/CMakeFiles/video_autogen.dir/clean:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && $(CMAKE_COMMAND) -P CMakeFiles/video_autogen.dir/cmake_clean.cmake
.PHONY : examples/video/CMakeFiles/video_autogen.dir/clean

examples/video/CMakeFiles/video_autogen.dir/depend:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ottersome/Projects/ITRI/nodeeditor /home/ottersome/Projects/ITRI/nodeeditor/examples/video /home/ottersome/Projects/ITRI/nodeeditor/build /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video/CMakeFiles/video_autogen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/video/CMakeFiles/video_autogen.dir/depend

