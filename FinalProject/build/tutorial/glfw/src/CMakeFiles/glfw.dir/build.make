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
include tutorial/glfw/src/CMakeFiles/glfw.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.make

# Include the progress variables for this target.
include tutorial/glfw/src/CMakeFiles/glfw.dir/progress.make

# Include the compile flags for this target's objects.
include tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make

tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/context.c
tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.o -MF CMakeFiles/glfw.dir/context.c.o.d -o CMakeFiles/glfw.dir/context.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/context.c

tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/context.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/context.c > CMakeFiles/glfw.dir/context.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/context.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/context.c -o CMakeFiles/glfw.dir/context.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/init.c
tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.o -MF CMakeFiles/glfw.dir/init.c.o.d -o CMakeFiles/glfw.dir/init.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/init.c

tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/init.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/init.c > CMakeFiles/glfw.dir/init.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/init.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/init.c -o CMakeFiles/glfw.dir/init.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/input.c
tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.o -MF CMakeFiles/glfw.dir/input.c.o.d -o CMakeFiles/glfw.dir/input.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/input.c

tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/input.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/input.c > CMakeFiles/glfw.dir/input.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/input.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/input.c -o CMakeFiles/glfw.dir/input.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/monitor.c
tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.o -MF CMakeFiles/glfw.dir/monitor.c.o.d -o CMakeFiles/glfw.dir/monitor.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/monitor.c

tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/monitor.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/monitor.c > CMakeFiles/glfw.dir/monitor.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/monitor.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/monitor.c -o CMakeFiles/glfw.dir/monitor.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/vulkan.c
tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o -MF CMakeFiles/glfw.dir/vulkan.c.o.d -o CMakeFiles/glfw.dir/vulkan.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/vulkan.c

tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/vulkan.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/vulkan.c > CMakeFiles/glfw.dir/vulkan.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/vulkan.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/vulkan.c -o CMakeFiles/glfw.dir/vulkan.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/window.c
tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.o -MF CMakeFiles/glfw.dir/window.c.o.d -o CMakeFiles/glfw.dir/window.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/window.c

tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/window.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/window.c > CMakeFiles/glfw.dir/window.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/window.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/window.c -o CMakeFiles/glfw.dir/window.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_init.m
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o -MF CMakeFiles/glfw.dir/cocoa_init.m.o.d -o CMakeFiles/glfw.dir/cocoa_init.m.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_init.m

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_init.m.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_init.m > CMakeFiles/glfw.dir/cocoa_init.m.i

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_init.m.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_init.m -o CMakeFiles/glfw.dir/cocoa_init.m.s

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_joystick.m
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o -MF CMakeFiles/glfw.dir/cocoa_joystick.m.o.d -o CMakeFiles/glfw.dir/cocoa_joystick.m.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_joystick.m

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_joystick.m.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_joystick.m > CMakeFiles/glfw.dir/cocoa_joystick.m.i

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_joystick.m.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_joystick.m -o CMakeFiles/glfw.dir/cocoa_joystick.m.s

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_monitor.m
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o -MF CMakeFiles/glfw.dir/cocoa_monitor.m.o.d -o CMakeFiles/glfw.dir/cocoa_monitor.m.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_monitor.m

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_monitor.m.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_monitor.m > CMakeFiles/glfw.dir/cocoa_monitor.m.i

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_monitor.m.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_monitor.m -o CMakeFiles/glfw.dir/cocoa_monitor.m.s

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_window.m
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o -MF CMakeFiles/glfw.dir/cocoa_window.m.o.d -o CMakeFiles/glfw.dir/cocoa_window.m.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_window.m

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_window.m.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_window.m > CMakeFiles/glfw.dir/cocoa_window.m.i

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_window.m.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_window.m -o CMakeFiles/glfw.dir/cocoa_window.m.s

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_time.c
tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o -MF CMakeFiles/glfw.dir/cocoa_time.c.o.d -o CMakeFiles/glfw.dir/cocoa_time.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_time.c

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_time.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_time.c > CMakeFiles/glfw.dir/cocoa_time.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_time.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/cocoa_time.c -o CMakeFiles/glfw.dir/cocoa_time.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/posix_thread.c
tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o -MF CMakeFiles/glfw.dir/posix_thread.c.o.d -o CMakeFiles/glfw.dir/posix_thread.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/posix_thread.c

tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/posix_thread.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/posix_thread.c > CMakeFiles/glfw.dir/posix_thread.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/posix_thread.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/posix_thread.c -o CMakeFiles/glfw.dir/posix_thread.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/nsgl_context.m
tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o -MF CMakeFiles/glfw.dir/nsgl_context.m.o.d -o CMakeFiles/glfw.dir/nsgl_context.m.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/nsgl_context.m

tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/nsgl_context.m.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/nsgl_context.m > CMakeFiles/glfw.dir/nsgl_context.m.i

tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/nsgl_context.m.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/nsgl_context.m -o CMakeFiles/glfw.dir/nsgl_context.m.s

tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/egl_context.c
tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o -MF CMakeFiles/glfw.dir/egl_context.c.o.d -o CMakeFiles/glfw.dir/egl_context.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/egl_context.c

tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/egl_context.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/egl_context.c > CMakeFiles/glfw.dir/egl_context.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/egl_context.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/egl_context.c -o CMakeFiles/glfw.dir/egl_context.c.s

tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/flags.make
tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o: /Users/bardamri/3DAnimation/ass3/external/glfw/src/osmesa_context.c
tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o: tutorial/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o -MF CMakeFiles/glfw.dir/osmesa_context.c.o.d -o CMakeFiles/glfw.dir/osmesa_context.c.o -c /Users/bardamri/3DAnimation/ass3/external/glfw/src/osmesa_context.c

tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/osmesa_context.c.i"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/bardamri/3DAnimation/ass3/external/glfw/src/osmesa_context.c > CMakeFiles/glfw.dir/osmesa_context.c.i

tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/osmesa_context.c.s"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/bardamri/3DAnimation/ass3/external/glfw/src/osmesa_context.c -o CMakeFiles/glfw.dir/osmesa_context.c.s

# Object files for target glfw
glfw_OBJECTS = \
"CMakeFiles/glfw.dir/context.c.o" \
"CMakeFiles/glfw.dir/init.c.o" \
"CMakeFiles/glfw.dir/input.c.o" \
"CMakeFiles/glfw.dir/monitor.c.o" \
"CMakeFiles/glfw.dir/vulkan.c.o" \
"CMakeFiles/glfw.dir/window.c.o" \
"CMakeFiles/glfw.dir/cocoa_init.m.o" \
"CMakeFiles/glfw.dir/cocoa_joystick.m.o" \
"CMakeFiles/glfw.dir/cocoa_monitor.m.o" \
"CMakeFiles/glfw.dir/cocoa_window.m.o" \
"CMakeFiles/glfw.dir/cocoa_time.c.o" \
"CMakeFiles/glfw.dir/posix_thread.c.o" \
"CMakeFiles/glfw.dir/nsgl_context.m.o" \
"CMakeFiles/glfw.dir/egl_context.c.o" \
"CMakeFiles/glfw.dir/osmesa_context.c.o"

# External object files for target glfw
glfw_EXTERNAL_OBJECTS =

libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/context.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/init.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/input.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/monitor.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/window.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/build.make
libglfw3.a: tutorial/glfw/src/CMakeFiles/glfw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/bardamri/3DAnimation/FinalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking C static library ../../../libglfw3.a"
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && $(CMAKE_COMMAND) -P CMakeFiles/glfw.dir/cmake_clean_target.cmake
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glfw.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorial/glfw/src/CMakeFiles/glfw.dir/build: libglfw3.a
.PHONY : tutorial/glfw/src/CMakeFiles/glfw.dir/build

tutorial/glfw/src/CMakeFiles/glfw.dir/clean:
	cd /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src && $(CMAKE_COMMAND) -P CMakeFiles/glfw.dir/cmake_clean.cmake
.PHONY : tutorial/glfw/src/CMakeFiles/glfw.dir/clean

tutorial/glfw/src/CMakeFiles/glfw.dir/depend:
	cd /Users/bardamri/3DAnimation/FinalProject/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/bardamri/3DAnimation/ass3 /Users/bardamri/3DAnimation/ass3/external/glfw/src /Users/bardamri/3DAnimation/FinalProject/build /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src /Users/bardamri/3DAnimation/FinalProject/build/tutorial/glfw/src/CMakeFiles/glfw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorial/glfw/src/CMakeFiles/glfw.dir/depend

