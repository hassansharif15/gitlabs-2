#!/bin/bash
# Create a directory, add a file, and display contents

mkdir -p my_folder
cd my_folder || exit
echo "Hello, this is a sample file." > myfile.txt
cat myfile.txt

