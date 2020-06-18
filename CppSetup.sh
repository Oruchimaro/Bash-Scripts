#!/bin/bash
echo "Make sure you have cmake, codelite, g++ installed"
echo "**********************Create A C++ Project ******************"

echo "Enter a Project Name (no spaces) : "

#project name
read pname

echo "***********************************************************"
echo "Creating C++ project :" $pname"..."

mkdir $pname

echo "***********************************************************"
echo "***********************************************************"

echo "Creating " $pname"/build"
mkdir $pname/build
echo "Creating " $pname"/src"
mkdir $pname/src
echo "Creating " $pname"/includes"
mkdir $pname/includes

echo "Initializing Git and Adding .gitignore and README.md..."
touch $pname/.gitignore
echo '/build' >> $pname/.gitignore

touch $pname/README.md
echo "# How To Use :" >> $pname/README.md
echo "  Clone this repository, cd into it" >> $pname/README.md
echo "  Create a build/ directory in project root, cd into it." >> $pname/README.md
echo "  Run This Commands : " >> $pname/README.md
echo "  \`\`\`SH" >> $pname/README.md
echo "      $ cmake .." >> $pname/README.md
echo "      $ make " >> $pname/README.md
echo "  \`\`\` " >> $pname/README.md

cd $pname
git init
cd ..

echo "Creating and Populating CMakeLists File For "$pname"..." 
touch $pname/CMakeLists.txt

#Fill CMakeLists files with setup needed for cmake
echo '# only for cmake --version >= 3.5.1' >> $pname/CMakeLists.txt
echo 'cmake_minimum_required(VERSION 3.5.1)' >> $pname/CMakeLists.txt

echo '# project name' >> $pname/CMakeLists.txt
echo 'project('$pname')' >> $pname/CMakeLists.txt

echo '# creates the variable EXEC ' >> $pname/CMakeLists.txt
echo 'set(EXEC '$pname')' >> $pname/CMakeLists.txt

echo '# set the C++14 standard' >> $pname/CMakeLists.txt
echo 'set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++14")' >> $pname/CMakeLists.txt

echo '# I../includes' >> $pname/CMakeLists.txt
echo 'include_directories(includes)' >> $pname/CMakeLists.txt

echo '# puts all .cpp files inside src to the SOURCES variable' >> $pname/CMakeLists.txt
echo 'file(GLOB SOURCES src/*.cpp)' >> $pname/CMakeLists.txt

echo '# compiles the files defined by SOURCES to generante the executable defined by EXEC' >> $pname/CMakeLists.txt
echo 'add_executable(${EXEC} ${SOURCES})' >> $pname/CMakeLists.txt

echo "CMakeLists File Ready..."
echo "Creating and Populating main.cpp file..."

#Make a main.cpp file with default code
touch $pname/src/main.cpp
echo '#include<iostream>' >> $pname/src/main.cpp
echo 'int main () { ' >> $pname/src/main.cpp
echo '      std::cout<< "Hello From ' $pname'" << std::endl ;' >> $pname/src/main.cpp
echo '      std::cin.get();' >> $pname/src/main.cpp
echo '}' >> $pname/src/main.cpp
  
echo "src/main.cpp ready..."

echo "***********************************************************"
echo "Making the Project..."
echo "======================= select the type ======================="
echo "  1)Normal Build With CMake..."
echo "  2)Build with Cmake For CodeLite"
cd $pname/build
read n
case $n in
    1)	
        #build with cmake
		cmake ..
		make
		echo "              Project" $pname "Created!"
		echo "Source Code files are in src/"
		echo "Build files are in build/ and can be run as ./"$pname
		echo "Includes will be added to includes/"
		echo "*********************  Select Editor *************************"
		echo " 1 - CodeLite"
		echo " 2 - nvim "
		echo " 3 - vim "
		echo " 4 - VSCode "
		read t
		case $t in
		    1)	cd ..
				codelite $pname.workspace &
				;;
			2)	cd ..
				nvim .	
				;;
			3)	cd ..
				vim .	
				;;
			4)	cd ..
				code .	
				;;
		esac 
		;;
#cmake with codelight directory struct
	2)	
		cmake .. -G "CodeLite - Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug
		echo "              Project" $pname "Created!"
		echo "Source Code files are in src/"
		echo "Build files are in build/ and can be run as ./"$pname
		echo "Includes will be added to includes/"
		echo "*********************  Select Editor *************************"
		echo " 1 - CodeLite"
		echo " 2 - nvim "
		echo " 3 - vim "
		echo " 4 - VSCode "
		read t
		case $t in
		    1)	
				codelite $pname.workspace &
				;;
			2)	cd ..
				nvim .	
				;;
			3)	cd ..
				vim .	
				;;
			4)	cd ..
				code .	
				;;
		esac 
		;;

    *) echo "invalid option";;
esac 


		
