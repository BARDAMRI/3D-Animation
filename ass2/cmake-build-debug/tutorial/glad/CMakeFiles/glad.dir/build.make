# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/bardamri/3DAnimation/ass2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/bardamri/3DAnimation/ass2/cmake-build-debug

# Include any dependencies generated for this target.
include tutorial/glad/CMakeFiles/glad.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tutorial/glad/CMakeFiles/glad.dir/compiler_depend.make

# Include the progress variables for this target.
include tutorial/glad/CMakeFiles/glad.dir/progress.make

# Include the compile flags for this target's objects.
include tutorial/glad/CMakeFiles/glad.dir/flags.make

tutorial/glad/CMakeFiles/glad.dir/src/glad.c.o: tutorial/glad/CMakeFiles/glad.dir/flags.make
tutorial/glad/CMakeFiles/glad.dir/src/glad.c.o: ../external/glad/src/glad.c
tutorial/glad/CMakeFiles/glad.dir/src/glad.c.o: tutorial/glad/CMakeFiles/glad.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/ass2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tutorial/glad/CMakeFiles/glad.dir/src/glad.c.o"
	cd /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glad/CMakeFiles/glad.dir/src/glad.c.o -MF CMakeFiles/glad.dir/src/glad.c.o.d -o CMakeFiles/glad.dir/src/glad.c.o -c /Users/bardamri/3DAnimation/ass2/external/glad/src/glad.c

tutorial/glad/CMakeFiles/glad.dir/src/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glad.dir/src/glad.c.i"
	cd /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass2/external/glad/src/glad.c > CMakeFiles/glad.dir/src/glad.c.i

tutorial/glad/CMakeFiles/glad.dir/src/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glad.dir/src/glad.c.s"
	cd /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass2/external/glad/src/glad.c -o CMakeFiles/glad.dir/src/glad.c.s

# Object files for target glad
glad_OBJECTS = \
"CMakeFiles/glad.dir/src/glad.c.o"

# External object files for target glad
glad_EXTERNAL_OBJECTS =

libglad.a: tutorial/glad/CMakeFiles/glad.dir/src/glad.c.o
libglad.a: tutorial/glad/CMakeFiles/glad.dir/build.make
libglad.a: tutorial/glad/CMakeFiles/glad.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/bardamri/3DAnimation/ass2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../libglad.a"
	cd /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad && $(CMAKE_COMMAND) -P CMakeFiles/glad.dir/cmake_clean_target.cmake
	cd /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glad.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorial/glad/CMakeFiles/glad.dir/build: libglad.a
.PHONY : tutorial/glad/CMakeFiles/glad.dir/build

tutorial/glad/CMakeFiles/glad.dir/clean:
	cd /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad && $(CMAKE_COMMAND) -P CMakeFiles/glad.dir/cmake_clean.cmake
.PHONY : tutorial/glad/CMakeFiles/glad.dir/clean

tutorial/glad/CMakeFiles/glad.dir/depend:
	cd /Users/bardamri/3DAnimation/ass2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/bardamri/3DAnimation/ass2 /Users/bardamri/3DAnimation/ass2/external/glad /Users/bardamri/3DAnimation/ass2/cmake-build-debug /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad /Users/bardamri/3DAnimation/ass2/cmake-build-debug/tutorial/glad/CMakeFiles/glad.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorial/glad/CMakeFiles/glad.dir/depend
