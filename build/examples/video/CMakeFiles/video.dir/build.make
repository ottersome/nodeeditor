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
include examples/video/CMakeFiles/video.dir/depend.make

# Include the progress variables for this target.
include examples/video/CMakeFiles/video.dir/progress.make

# Include the compile flags for this target's objects.
include examples/video/CMakeFiles/video.dir/flags.make

examples/video/CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.o: examples/video/CMakeFiles/video.dir/flags.make
examples/video/CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.o: examples/video/video_autogen/mocs_compilation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/video/CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video/video_autogen/mocs_compilation.cpp

examples/video/CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video/video_autogen/mocs_compilation.cpp > CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.i

examples/video/CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video/video_autogen/mocs_compilation.cpp -o CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.s

examples/video/CMakeFiles/video.dir/ImageShowModel.cpp.o: examples/video/CMakeFiles/video.dir/flags.make
examples/video/CMakeFiles/video.dir/ImageShowModel.cpp.o: ../examples/video/ImageShowModel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object examples/video/CMakeFiles/video.dir/ImageShowModel.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/video.dir/ImageShowModel.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/video/ImageShowModel.cpp

examples/video/CMakeFiles/video.dir/ImageShowModel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video.dir/ImageShowModel.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/video/ImageShowModel.cpp > CMakeFiles/video.dir/ImageShowModel.cpp.i

examples/video/CMakeFiles/video.dir/ImageShowModel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video.dir/ImageShowModel.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/video/ImageShowModel.cpp -o CMakeFiles/video.dir/ImageShowModel.cpp.s

examples/video/CMakeFiles/video.dir/RSCameraManager.cpp.o: examples/video/CMakeFiles/video.dir/flags.make
examples/video/CMakeFiles/video.dir/RSCameraManager.cpp.o: ../examples/video/RSCameraManager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object examples/video/CMakeFiles/video.dir/RSCameraManager.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/video.dir/RSCameraManager.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/video/RSCameraManager.cpp

examples/video/CMakeFiles/video.dir/RSCameraManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video.dir/RSCameraManager.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/video/RSCameraManager.cpp > CMakeFiles/video.dir/RSCameraManager.cpp.i

examples/video/CMakeFiles/video.dir/RSCameraManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video.dir/RSCameraManager.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/video/RSCameraManager.cpp -o CMakeFiles/video.dir/RSCameraManager.cpp.s

examples/video/CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.o: examples/video/CMakeFiles/video.dir/flags.make
examples/video/CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.o: ../examples/video/RSColorImageLoaderModel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object examples/video/CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/video/RSColorImageLoaderModel.cpp

examples/video/CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/video/RSColorImageLoaderModel.cpp > CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.i

examples/video/CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/video/RSColorImageLoaderModel.cpp -o CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.s

examples/video/CMakeFiles/video.dir/main.cpp.o: examples/video/CMakeFiles/video.dir/flags.make
examples/video/CMakeFiles/video.dir/main.cpp.o: ../examples/video/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object examples/video/CMakeFiles/video.dir/main.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/video.dir/main.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/video/main.cpp

examples/video/CMakeFiles/video.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video.dir/main.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/video/main.cpp > CMakeFiles/video.dir/main.cpp.i

examples/video/CMakeFiles/video.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video.dir/main.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/video/main.cpp -o CMakeFiles/video.dir/main.cpp.s

# Object files for target video
video_OBJECTS = \
"CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/video.dir/ImageShowModel.cpp.o" \
"CMakeFiles/video.dir/RSCameraManager.cpp.o" \
"CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.o" \
"CMakeFiles/video.dir/main.cpp.o"

# External object files for target video
video_EXTERNAL_OBJECTS =

bin/video: examples/video/CMakeFiles/video.dir/video_autogen/mocs_compilation.cpp.o
bin/video: examples/video/CMakeFiles/video.dir/ImageShowModel.cpp.o
bin/video: examples/video/CMakeFiles/video.dir/RSCameraManager.cpp.o
bin/video: examples/video/CMakeFiles/video.dir/RSColorImageLoaderModel.cpp.o
bin/video: examples/video/CMakeFiles/video.dir/main.cpp.o
bin/video: examples/video/CMakeFiles/video.dir/build.make
bin/video: lib/libnodes.so
bin/video: /usr/lib/libQt5OpenGL.so.5.15.0
bin/video: /usr/lib/libQt5Widgets.so.5.15.0
bin/video: /usr/lib/libQt5Gui.so.5.15.0
bin/video: /usr/lib/libQt5Core.so.5.15.0
bin/video: /usr/lib/librealsense2.so
bin/video: examples/video/CMakeFiles/video.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable ../../bin/video"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/video.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/video/CMakeFiles/video.dir/build: bin/video

.PHONY : examples/video/CMakeFiles/video.dir/build

examples/video/CMakeFiles/video.dir/clean:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video && $(CMAKE_COMMAND) -P CMakeFiles/video.dir/cmake_clean.cmake
.PHONY : examples/video/CMakeFiles/video.dir/clean

examples/video/CMakeFiles/video.dir/depend:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ottersome/Projects/ITRI/nodeeditor /home/ottersome/Projects/ITRI/nodeeditor/examples/video /home/ottersome/Projects/ITRI/nodeeditor/build /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video /home/ottersome/Projects/ITRI/nodeeditor/build/examples/video/CMakeFiles/video.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/video/CMakeFiles/video.dir/depend

