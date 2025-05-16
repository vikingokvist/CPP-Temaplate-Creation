# C++ Project Skeleton Generator

This shell script automates the repetitive process of creating boilerplate folder structures and class files for C++ projects (especially useful for 42 school exercises or modular C++ development).

## What It Does

Given a folder name and one or more class names, it:

- Creates a project directory with `src/`, `includes/`, and `Makefile`
- For each class name, generates:
  - `includes/ClassName.hpp` with class declaration and include guards
  - `src/ClassName.cpp` with method definitions
- Generates a `main.cpp` that includes all the header files
- Populates a `Makefile` that compiles the sources into an executable

### Example Output Structure
```bash
createcpp ex00 Serializer DataCamel LolGirl
```

```bash
ex00/
├── includes/
│   ├── Serializer.hpp
│   ├── DataCamel.hpp
│   └── LolGirl.hpp
├── src/
│   ├── Serializer.cpp
│   ├── DataCamel.cpp
│   ├── LolGirl.cpp
│   └── main.cpp
└── Makefile
```

- Generates:
- `includes/ClassName.hpp` – Header file with class declaration
- `src/ClassName.cpp` – Source file with method definitions
- A `Makefile` ready to compile your project
- A `main.cpp` including all headers

## Installation

You can save the script for global use in bash:
```
mkdir -p ~/.scripts && \
nano ~/.scripts/createcpp.sh && \
chmod +x ~/.scripts/createcpp.sh && \
echo "alias createcpp='~/.scripts/createcpp.sh'" >> ~/.bashrc && \
source ~/.bashrc
```

For zsh:
```
mkdir -p ~/.scripts && \
nano ~/.scripts/createcpp.sh && \
chmod +x ~/.scripts/createcpp.sh && \
echo "alias createcpp='~/.scripts/createcpp.sh'" >> ~/.zshrc && \
source ~/.zshrc
```
