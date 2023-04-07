#!/bin/zsh

solc --ir src/$1.sol -o src/$1.yul --overwrite; rm src/$1.yul/$1Storage.yul
cargo run src/$1.yul/$1.yul


input_file="src/$1.yul/$1.yul"
# Get object names
object_name=$(grep "object" "$input_file" | sed 's/.*"\(.*\)".*/\1/' | head -1)
perl -i -pe "s/\Q$object_name\E/Counter_1337/g" "$input_file"
forge build


# Replace object names with "Counter_1337"
