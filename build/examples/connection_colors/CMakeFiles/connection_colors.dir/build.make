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

# Include any dependencies generated for this target.
include examples/connection_colors/CMakeFiles/connection_colors.dir/depend.make

# Include the progress variables for this target.
include examples/connection_colors/CMakeFiles/connection_colors.dir/progress.make

# Include the compile flags for this target's objects.
include examples/connection_colors/CMakeFiles/connection_colors.dir/flags.make

examples/connection_colors/CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.o: examples/connection_colors/CMakeFiles/connection_colors.dir/flags.make
examples/connection_colors/CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.o: examples/connection_colors/connection_colors_autogen/mocs_compilation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/connection_colors/CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors/connection_colors_autogen/mocs_compilation.cpp

examples/connection_colors/CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors/connection_colors_autogen/mocs_compilation.cpp > CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.i

examples/connection_colors/CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors/connection_colors_autogen/mocs_compilation.cpp -o CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.s

examples/connection_colors/CMakeFiles/connection_colors.dir/main.cpp.o: examples/connection_colors/CMakeFiles/connection_colors.dir/flags.make
examples/connection_colors/CMakeFiles/connection_colors.dir/main.cpp.o: ../examples/connection_colors/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object examples/connection_colors/CMakeFiles/connection_colors.dir/main.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/connection_colors.dir/main.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors/main.cpp

examples/connection_colors/CMakeFiles/connection_colors.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/connection_colors.dir/main.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors/main.cpp > CMakeFiles/connection_colors.dir/main.cpp.i

examples/connection_colors/CMakeFiles/connection_colors.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/connection_colors.dir/main.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors/main.cpp -o CMakeFiles/connection_colors.dir/main.cpp.s

examples/connection_colors/CMakeFiles/connection_colors.dir/models.cpp.o: examples/connection_colors/CMakeFiles/connection_colors.dir/flags.make
examples/connection_colors/CMakeFiles/connection_colors.dir/models.cpp.o: ../examples/connection_colors/models.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object examples/connection_colors/CMakeFiles/connection_colors.dir/models.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/connection_colors.dir/models.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors/models.cpp

examples/connection_colors/CMakeFiles/connection_colors.dir/models.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/connection_colors.dir/models.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors/models.cpp > CMakeFiles/connection_colors.dir/models.cpp.i

examples/connection_colors/CMakeFiles/connection_colors.dir/models.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/connection_colors.dir/models.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors/models.cpp -o CMakeFiles/connection_colors.dir/models.cpp.s

# Object files for target connection_colors
connection_colors_OBJECTS = \
"CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/connection_colors.dir/main.cpp.o" \
"CMakeFiles/connection_colors.dir/models.cpp.o"

# External object files for target connection_colors
connection_colors_EXTERNAL_OBJECTS =

bin/connection_colors: examples/connection_colors/CMakeFiles/connection_colors.dir/connection_colors_autogen/mocs_compilation.cpp.o
bin/connection_colors: examples/connection_colors/CMakeFiles/connection_colors.dir/main.cpp.o
bin/connection_colors: examples/connection_colors/CMakeFiles/connection_colors.dir/models.cpp.o
bin/connection_colors: examples/connection_colors/CMakeFiles/connection_colors.dir/build.make
bin/connection_colors: lib/libnodes.so
bin/connection_colors: /usr/lib/libQt5OpenGL.so.5.15.0
bin/connection_colors: /usr/lib/libQt5Widgets.so.5.15.0
bin/connection_colors: /usr/lib/libQt5Gui.so.5.15.0
bin/connection_colors: /usr/lib/libQt5Core.so.5.15.0
bin/connection_colors: /usr/lib/librealsense2.so
bin/connection_colors: examples/connection_colors/CMakeFiles/connection_colors.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../../bin/connection_colors"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/connection_colors.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/connection_colors/CMakeFiles/connection_colors.dir/build: bin/connection_colors

.PHONY : examples/connection_colors/CMakeFiles/connection_colors.dir/build

examples/connection_colors/CMakeFiles/connection_colors.dir/clean:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors && $(CMAKE_COMMAND) -P CMakeFiles/connection_colors.dir/cmake_clean.cmake
.PHONY : examples/connection_colors/CMakeFiles/connection_colors.dir/clean

examples/connection_colors/CMakeFiles/connection_colors.dir/depend:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ottersome/Projects/ITRI/nodeeditor /home/ottersome/Projects/ITRI/nodeeditor/examples/connection_colors /home/ottersome/Projects/ITRI/nodeeditor/build /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors /home/ottersome/Projects/ITRI/nodeeditor/build/examples/connection_colors/CMakeFiles/connection_colors.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/connection_colors/CMakeFiles/connection_colors.dir/depend

