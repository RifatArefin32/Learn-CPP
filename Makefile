# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++20 -Wall -I./include

# Directories
SRC_DIR = src
BUILD_DIR = build

# Files and output
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(SRC_FILES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)
EXEC = $(BUILD_DIR)/app

# Default target to build everything
all: $(EXEC)

# Linking the object files to create the executable
$(EXEC): $(OBJ_FILES)
	$(CXX) $(OBJ_FILES) -o $(EXEC)

# Compile each source file into an object file
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean the build directory
clean:
	rm -rf $(BUILD_DIR)/*

# Debug build (with debugging symbols)
debug: CXXFLAGS += -g
debug: $(EXEC)

# Run the program
run: $(EXEC)
	./$(EXEC)

.PHONY: all clean debug run


# CXX is the compiler (g++).

# CXXFLAGS contains flags for the compiler, including the standard (-std=c++20) and the directory for header files (-I./include).

# SRC_FILES stores all .cpp files in the src directory.

# OBJ_FILES maps each .cpp file to an object file (.o) in the build directory.

# $(EXEC) is the name of the output executable.

# The all target builds the project by linking all object files into the executable.

# The clean target removes the build files.

# The debug target enables debugging symbols with the -g flag.

# The run target will execute the program after it’s built.