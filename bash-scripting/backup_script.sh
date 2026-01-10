#!/bin/bash
# Backup all .txt files to a backup directory

src_dir="./"
backup_dir="./backup"

mkdir -p "$backup_dir"
cp *.txt "$backup_dir" 2>/dev/null
echo "✅ Backup completed. Files copied to $backup_dir."

