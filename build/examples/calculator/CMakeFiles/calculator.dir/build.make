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
include examples/calculator/CMakeFiles/calculator.dir/depend.make

# Include the progress variables for this target.
include examples/calculator/CMakeFiles/calculator.dir/progress.make

# Include the compile flags for this target's objects.
include examples/calculator/CMakeFiles/calculator.dir/flags.make

examples/calculator/CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.o: examples/calculator/CMakeFiles/calculator.dir/flags.make
examples/calculator/CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.o: examples/calculator/calculator_autogen/mocs_compilation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/calculator/CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator/calculator_autogen/mocs_compilation.cpp

examples/calculator/CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator/calculator_autogen/mocs_compilation.cpp > CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.i

examples/calculator/CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator/calculator_autogen/mocs_compilation.cpp -o CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.s

examples/calculator/CMakeFiles/calculator.dir/Converters.cpp.o: examples/calculator/CMakeFiles/calculator.dir/flags.make
examples/calculator/CMakeFiles/calculator.dir/Converters.cpp.o: ../examples/calculator/Converters.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object examples/calculator/CMakeFiles/calculator.dir/Converters.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calculator.dir/Converters.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/Converters.cpp

examples/calculator/CMakeFiles/calculator.dir/Converters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calculator.dir/Converters.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/Converters.cpp > CMakeFiles/calculator.dir/Converters.cpp.i

examples/calculator/CMakeFiles/calculator.dir/Converters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calculator.dir/Converters.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/Converters.cpp -o CMakeFiles/calculator.dir/Converters.cpp.s

examples/calculator/CMakeFiles/calculator.dir/MathOperationDataModel.cpp.o: examples/calculator/CMakeFiles/calculator.dir/flags.make
examples/calculator/CMakeFiles/calculator.dir/MathOperationDataModel.cpp.o: ../examples/calculator/MathOperationDataModel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object examples/calculator/CMakeFiles/calculator.dir/MathOperationDataModel.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calculator.dir/MathOperationDataModel.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/MathOperationDataModel.cpp

examples/calculator/CMakeFiles/calculator.dir/MathOperationDataModel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calculator.dir/MathOperationDataModel.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/MathOperationDataModel.cpp > CMakeFiles/calculator.dir/MathOperationDataModel.cpp.i

examples/calculator/CMakeFiles/calculator.dir/MathOperationDataModel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calculator.dir/MathOperationDataModel.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/MathOperationDataModel.cpp -o CMakeFiles/calculator.dir/MathOperationDataModel.cpp.s

examples/calculator/CMakeFiles/calculator.dir/ModuloModel.cpp.o: examples/calculator/CMakeFiles/calculator.dir/flags.make
examples/calculator/CMakeFiles/calculator.dir/ModuloModel.cpp.o: ../examples/calculator/ModuloModel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object examples/calculator/CMakeFiles/calculator.dir/ModuloModel.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calculator.dir/ModuloModel.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/ModuloModel.cpp

examples/calculator/CMakeFiles/calculator.dir/ModuloModel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calculator.dir/ModuloModel.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/ModuloModel.cpp > CMakeFiles/calculator.dir/ModuloModel.cpp.i

examples/calculator/CMakeFiles/calculator.dir/ModuloModel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calculator.dir/ModuloModel.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/ModuloModel.cpp -o CMakeFiles/calculator.dir/ModuloModel.cpp.s

examples/calculator/CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.o: examples/calculator/CMakeFiles/calculator.dir/flags.make
examples/calculator/CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.o: ../examples/calculator/NumberDisplayDataModel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object examples/calculator/CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/NumberDisplayDataModel.cpp

examples/calculator/CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/NumberDisplayDataModel.cpp > CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.i

examples/calculator/CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/NumberDisplayDataModel.cpp -o CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.s

examples/calculator/CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.o: examples/calculator/CMakeFiles/calculator.dir/flags.make
examples/calculator/CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.o: ../examples/calculator/NumberSourceDataModel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object examples/calculator/CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/NumberSourceDataModel.cpp

examples/calculator/CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/NumberSourceDataModel.cpp > CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.i

examples/calculator/CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/NumberSourceDataModel.cpp -o CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.s

examples/calculator/CMakeFiles/calculator.dir/main.cpp.o: examples/calculator/CMakeFiles/calculator.dir/flags.make
examples/calculator/CMakeFiles/calculator.dir/main.cpp.o: ../examples/calculator/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object examples/calculator/CMakeFiles/calculator.dir/main.cpp.o"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/calculator.dir/main.cpp.o -c /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/main.cpp

examples/calculator/CMakeFiles/calculator.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calculator.dir/main.cpp.i"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/main.cpp > CMakeFiles/calculator.dir/main.cpp.i

examples/calculator/CMakeFiles/calculator.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calculator.dir/main.cpp.s"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator/main.cpp -o CMakeFiles/calculator.dir/main.cpp.s

# Object files for target calculator
calculator_OBJECTS = \
"CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/calculator.dir/Converters.cpp.o" \
"CMakeFiles/calculator.dir/MathOperationDataModel.cpp.o" \
"CMakeFiles/calculator.dir/ModuloModel.cpp.o" \
"CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.o" \
"CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.o" \
"CMakeFiles/calculator.dir/main.cpp.o"

# External object files for target calculator
calculator_EXTERNAL_OBJECTS =

bin/calculator: examples/calculator/CMakeFiles/calculator.dir/calculator_autogen/mocs_compilation.cpp.o
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/Converters.cpp.o
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/MathOperationDataModel.cpp.o
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/ModuloModel.cpp.o
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/NumberDisplayDataModel.cpp.o
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/NumberSourceDataModel.cpp.o
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/main.cpp.o
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/build.make
bin/calculator: lib/libnodes.so
bin/calculator: /usr/lib/libQt5OpenGL.so.5.15.0
bin/calculator: /usr/lib/libQt5Widgets.so.5.15.0
bin/calculator: /usr/lib/libQt5Gui.so.5.15.0
bin/calculator: /usr/lib/libQt5Core.so.5.15.0
bin/calculator: /usr/lib/librealsense2.so
bin/calculator: examples/calculator/CMakeFiles/calculator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ottersome/Projects/ITRI/nodeeditor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable ../../bin/calculator"
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/calculator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/calculator/CMakeFiles/calculator.dir/build: bin/calculator

.PHONY : examples/calculator/CMakeFiles/calculator.dir/build

examples/calculator/CMakeFiles/calculator.dir/clean:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator && $(CMAKE_COMMAND) -P CMakeFiles/calculator.dir/cmake_clean.cmake
.PHONY : examples/calculator/CMakeFiles/calculator.dir/clean

examples/calculator/CMakeFiles/calculator.dir/depend:
	cd /home/ottersome/Projects/ITRI/nodeeditor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ottersome/Projects/ITRI/nodeeditor /home/ottersome/Projects/ITRI/nodeeditor/examples/calculator /home/ottersome/Projects/ITRI/nodeeditor/build /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator /home/ottersome/Projects/ITRI/nodeeditor/build/examples/calculator/CMakeFiles/calculator.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/calculator/CMakeFiles/calculator.dir/depend

