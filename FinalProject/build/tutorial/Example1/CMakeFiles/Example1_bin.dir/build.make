# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

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
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/bardamri/3DAnimation/ass3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/bardamri/3DAnimation/FinalProject/build

# Include any dependencies generated for this target.
include tutorial/Example1/CMakeFiles/Example1_bin.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tutorial/Example1/CMakeFiles/Example1_bin.dir/compiler_depend.make

# Include the progress variables for this target.
include tutorial/Example1/CMakeFiles/Example1_bin.dir/progress.make

# Include the compile flags for this target's objects.
include tutorial/Example1/CMakeFiles/Example1_bin.dir/flags.make

tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/flags.make
tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.o: /Users/bardamri/3DAnimation/ass3/tutorial/Example1/BasicScene.cpp
tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.o -MF CMakeFiles/Example1_bin.dir/BasicScene.cpp.o.d -o CMakeFiles/Example1_bin.dir/BasicScene.cpp.o -c /Users/bardamri/3DAnimation/ass3/tutorial/Example1/BasicScene.cpp

tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Example1_bin.dir/BasicScene.cpp.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/bardamri/3DAnimation/ass3/tutorial/Example1/BasicScene.cpp > CMakeFiles/Example1_bin.dir/BasicScene.cpp.i

tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Example1_bin.dir/BasicScene.cpp.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/bardamri/3DAnimation/ass3/tutorial/Example1/BasicScene.cpp -o CMakeFiles/Example1_bin.dir/BasicScene.cpp.s

tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/flags.make
tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.o: /Users/bardamri/3DAnimation/ass3/tutorial/Example1/Example1.cpp
tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.o -MF CMakeFiles/Example1_bin.dir/Example1.cpp.o.d -o CMakeFiles/Example1_bin.dir/Example1.cpp.o -c /Users/bardamri/3DAnimation/ass3/tutorial/Example1/Example1.cpp

tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Example1_bin.dir/Example1.cpp.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/bardamri/3DAnimation/ass3/tutorial/Example1/Example1.cpp > CMakeFiles/Example1_bin.dir/Example1.cpp.i

tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Example1_bin.dir/Example1.cpp.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/bardamri/3DAnimation/ass3/tutorial/Example1/Example1.cpp -o CMakeFiles/Example1_bin.dir/Example1.cpp.s

tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/flags.make
tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o: /Users/bardamri/3DAnimation/ass3/tutorial/Example1/IglMeshLoader.cpp
tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o -MF CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o.d -o CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o -c /Users/bardamri/3DAnimation/ass3/tutorial/Example1/IglMeshLoader.cpp

tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/bardamri/3DAnimation/ass3/tutorial/Example1/IglMeshLoader.cpp > CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.i

tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/bardamri/3DAnimation/ass3/tutorial/Example1/IglMeshLoader.cpp -o CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.s

tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/flags.make
tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o: /Users/bardamri/3DAnimation/ass3/tutorial/Example1/SceneWithCameras.cpp
tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o: tutorial/Example1/CMakeFiles/Example1_bin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o -MF CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o.d -o CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o -c /Users/bardamri/3DAnimation/ass3/tutorial/Example1/SceneWithCameras.cpp

tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/bardamri/3DAnimation/ass3/tutorial/Example1/SceneWithCameras.cpp > CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.i

tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/bardamri/3DAnimation/ass3/tutorial/Example1/SceneWithCameras.cpp -o CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.s

# Object files for target Example1_bin
Example1_bin_OBJECTS = \
"CMakeFiles/Example1_bin.dir/BasicScene.cpp.o" \
"CMakeFiles/Example1_bin.dir/Example1.cpp.o" \
"CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o" \
"CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o"

# External object files for target Example1_bin
Example1_bin_EXTERNAL_OBJECTS =

Example1_bin: tutorial/Example1/CMakeFiles/Example1_bin.dir/BasicScene.cpp.o
Example1_bin: tutorial/Example1/CMakeFiles/Example1_bin.dir/Example1.cpp.o
Example1_bin: tutorial/Example1/CMakeFiles/Example1_bin.dir/IglMeshLoader.cpp.o
Example1_bin: tutorial/Example1/CMakeFiles/Example1_bin.dir/SceneWithCameras.cpp.o
Example1_bin: tutorial/Example1/CMakeFiles/Example1_bin.dir/build.make
Example1_bin: libengine.a
Example1_bin: libigl.a
Example1_bin: libigl_opengl.a
Example1_bin: libigl_opengl_glfw.a
Example1_bin: libigl_opengl_glfw_imgui.a
Example1_bin: libigl_png.a
Example1_bin: libigl_opengl_glfw.a
Example1_bin: libimguizmo.a
Example1_bin: libimgui.a
Example1_bin: libglfw3.a
Example1_bin: libigl_opengl.a
Example1_bin: libigl.a
Example1_bin: /Library/Developer/CommandLineTools/SDKs/MacOSX13.1.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd
Example1_bin: libglad.a
Example1_bin: libigl_stb_image.a
Example1_bin: tutorial/Example1/CMakeFiles/Example1_bin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable ../../Example1_bin"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Example1_bin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorial/Example1/CMakeFiles/Example1_bin.dir/build: Example1_bin
.PHONY : tutorial/Example1/CMakeFiles/Example1_bin.dir/build

tutorial/Example1/CMakeFiles/Example1_bin.dir/clean:
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 && $(CMAKE_COMMAND) -P CMakeFiles/Example1_bin.dir/cmake_clean.cmake
.PHONY : tutorial/Example1/CMakeFiles/Example1_bin.dir/clean

tutorial/Example1/CMakeFiles/Example1_bin.dir/depend:
	cd /Users/bardamri/3DAnimation/FinalProject/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/bardamri/3DAnimation/ass3 /Users/bardamri/3DAnimation/ass3/tutorial/Example1 /Users/bardamri/3DAnimation/FinalProject/build /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1 /Users/bardamri/3DAnimation/FinalProject/build/tutorial/Example1/CMakeFiles/Example1_bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorial/Example1/CMakeFiles/Example1_bin.dir/depend

