
#!/bin/sh

if [ "$#" -lt 2 ]; then
    echo "Usage: sh $0 <Folder> <Class1> [Class2 ...]"
    exit 1
fi

project_name="$1"
shift

mkdir -p "$project_name"/src "$project_name"/includes

cd "$project_name" || exit

touch Makefile src/main.cpp

for class_name in "$@";
do

    header_file="includes/${class_name}.hpp"
    source_file="src/${class_name}.cpp"
    include_guard=$(echo "${class_name}_HPP" | tr '[:lower:]' '[:upper:]')


    cat << EOF > "$header_file"
#ifndef ${include_guard}
#define ${include_guard}

#include <iostream>
#include <string>

class ${class_name}
{
    private:

    public:
        ${class_name}();
        ${class_name}(const ${class_name}& src);
        ${class_name}& operator=(const ${class_name}& src);
        ~${class_name}();
};

#endif
EOF

    cat << EOF > "$source_file"
#include "../includes/${class_name}.hpp"

${class_name}::${class_name}() {}

${class_name}::${class_name}(const ${class_name}& src) {
    *this = src;
}

${class_name}& ${class_name}::operator=(const ${class_name}& src) {
    if (this != &src) {

    }
    return *this;
}

${class_name}::~${class_name}() {}
EOF

cat << EOF >> src/main.cpp
#include "../includes/${class_name}.hpp"
EOF
done

cat << EOF >> src/main.cpp

int     main(void)
{

    return (0);
}
EOF

all_sources="src/main.cpp"
for class_name in "$@"; do
    all_sources="$all_sources src/${class_name}.cpp"
done

cat <<EOF > Makefile
NAME = execute #Change this if wanted

CPP = c++
CPPFLAGS = -Wall -Wextra -Werror -std=c++98

RM = rm -rf

SRCS = ${all_sources}

OBJS = \$(SRCS:.cpp=.o)

all: \$(NAME)

%.o: %.cpp
	\$(CPP) \$(CPPFLAGS) -o \$@ -c \$<

\$(NAME): \$(OBJS)
	\$(CPP) \$(CPPFLAGS) \$(OBJS) -o \$(NAME)

clean:
	\$(RM) \$(OBJS)

fclean:
	\$(RM) \$(OBJS) \$(NAME)

re: fclean all
EOF


echo "DONE!!!"
