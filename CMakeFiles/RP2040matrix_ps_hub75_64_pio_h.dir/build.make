# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/oxiin/pico/RP2040matrix-v2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oxiin/pico/RP2040matrix-v2

# Utility rule file for RP2040matrix_ps_hub75_64_pio_h.

# Include any custom commands dependencies for this target.
include CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/progress.make

CMakeFiles/RP2040matrix_ps_hub75_64_pio_h: ps_hub75_64.pio.h

ps_hub75_64.pio.h: ps_hub75_64.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/oxiin/pico/RP2040matrix-v2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ps_hub75_64.pio.h"
	pioasm/pioasm -o c-sdk /home/oxiin/pico/RP2040matrix-v2/ps_hub75_64.pio /home/oxiin/pico/RP2040matrix-v2/ps_hub75_64.pio.h

RP2040matrix_ps_hub75_64_pio_h: CMakeFiles/RP2040matrix_ps_hub75_64_pio_h
RP2040matrix_ps_hub75_64_pio_h: ps_hub75_64.pio.h
RP2040matrix_ps_hub75_64_pio_h: CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/build.make
.PHONY : RP2040matrix_ps_hub75_64_pio_h

# Rule to build all files generated by this target.
CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/build: RP2040matrix_ps_hub75_64_pio_h
.PHONY : CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/build

CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/cmake_clean.cmake
.PHONY : CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/clean

CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/depend:
	cd /home/oxiin/pico/RP2040matrix-v2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oxiin/pico/RP2040matrix-v2 /home/oxiin/pico/RP2040matrix-v2 /home/oxiin/pico/RP2040matrix-v2 /home/oxiin/pico/RP2040matrix-v2 /home/oxiin/pico/RP2040matrix-v2/CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/RP2040matrix_ps_hub75_64_pio_h.dir/depend

