#!/bin/bash
# Check if a file exists and its permissions

read -p "Enter file name to check: " filename

if [ -e "$filename" ]; then
  echo "✅ File exists."
  [ -r "$filename" ] && echo "Readable."
  [ -w "$filename" ] && echo "Writable."
  [ -x "$filename" ] && echo "Executable."
else
  echo "❌ File does not exist."
fi

