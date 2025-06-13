#!/bin/bash

# --- Help message ---
print_help() {
    echo "🧭 Usage: ./tuxtorial.sh [part]"
    echo ""
    echo "Available options:"
    echo "  part1         📍 Check current directory with 'pwd'"
    echo "  part2         📂 Explore a folder with 'ls <folder>'"
    echo "  part3         📄 (Coming soon!) Read files with 'cat' and 'less'"
	echo "  --commands    📖 Show the Command Reference (learned commands)"
    echo "  --help        🆘 Show this help message"
    echo ""
    echo "If no part is specified, all parts will run in order."
	echo "Press Ctrl+C anytime to quit the tuxtorial"
}


# Check if the user asked for help
print_commands(){
    echo "🐧 Tux’s Tuxtorial — Command Reference"
    echo ""
    echo "Here are the commands you are learning:"
    echo ""
    echo "  pwd           - Print the current working directory (absolute path)"
    echo "  ls            - List files and directories in the current folder"
	echo "  ls <folder>   - List files and directories in the given folder"
    echo "  cd            - Go to your home directory (shortcut to ~)"
    echo "  cd <folder>   - Move into a subdirectory (e.g., cd Documents)"
    echo "  cd ..         - Move up one directory (to the parent folder)"
    echo "  less          - View the contents of a file page by page"
    echo "  cat           - Print the contents of a file to the terminal"
    echo "  zcat          - Print the contents of a compressed (.gz) file"
    echo "  wc -l         - Count the number of lines in a file"
    echo ""
    echo "Run ./tuxtorial.sh to continue the interactive tutorial."
    exit 0
}

# ToDo:
# introduce ~
# cp
# mv
# rm
# rm -r
# mkdir
# man command, command --help
# Probably get sections that you can choose: navigating file system (pwd, ls, ls <>, cd, cd .., cd <>),changing the file system (cp,mv, rm, mkdir, rm -r), process text data (read, wc -l)  
# 

# tasks I came up with so far:
# 

#clear
echo "Hi! My name is Tux! 🐧"
sleep 1

echo ""
echo "To go through this tutorial with me, you need to open a second shell parallel to this shell"
echo "There you will learn and practice shell commands!"

sleep 1

part1() {
echo ""
echo "🧩 Part 1: navigating the filesystem"
echo ""
echo "🧭 Let's learn how to find where you are in the filesystem!"

# Getting script dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Step 1: Absolute path with pwd
echo ""
echo "📘 First, let's try our first command: pwd"
echo "Tris command will output an absolute path to your current position in a file system (we will call it a current working directory)"
echo ""
echo "Open a second shell and type there a command:"
echo "pwd"
echo ""
echo "What is your current working directory?"

user_input=""
while true; do
    read -p "🧠 Enter your current working directory: " user_input

    if [[ -d "$user_input" ]]; then
        echo "✅ Well done!"
        break
    else
        echo "❌ The path you gave me does not exist on your system. Try again!"
		echo "Hint: a path could look like /home/elephant"
    fi
done

echo ""
echo "You can 'jump' through the file system with tha command cd (=change directory)"
echo "Typing 'cd' without any argument and hitting Enter will bring you to your user home directory"
echo "This is very useful if you are lost in the file system, and just want to 'get back home' :)"
echo ""
echo "🔍 Lets try just that, run this code in your second shell:"
echo "    cd"
echo ""
echo "'cd' normally does not give any output, it just does its work. So lets move on and check your position now."

command=""
while [[ "$command" != "pwd" ]]; do
    read -p "🧠 What is the command to check your current working directory? Test it in your second shell, and type it for me here:" command

    if [[ "$command" != "pwd" ]]; then
        echo ""
        echo "❌ '$command' is not one of the commands we learned. Please try again!"
		echo "(Or press Ctrl+C to quit this tutorial)"
        echo ""
    fi
done

user_input=""
while true; do
    read -p "🧠 Enter your home path: " user_input

    if [[ "$user_input" == "$HOME" ]]; then
        echo "✅ Correct! That is your home directory."
        break
    else
        echo "❌ Nope, that's not your home directory. Try again!"
    fi
done

echo "Now, wherever you are lets get back to the directory this script is in and start working with supplied data!"
echo "Get you current working directory. To do so, run 'pwd' in your second shell"
#Check if the user is in the same directory
user_in1=""
while [[ "$user_in1" != "$SCRIPT_DIR" ]]; do
    read -p "🧠 Copy here the output of your command and hit Enter: " user_in1

    if [[ "$user_in1" != "$SCRIPT_DIR" ]]; then
        echo ""
        echo "🔁 Please change your current working directory."
		echo "To do so use command cd (=change directory)"
		echo "Type in your second shell:"
        echo "    cd \"$SCRIPT_DIR\""
        echo "Then run 'pwd' again and paste the result here."
        echo "(Press Ctrl+C to quit)"
        echo ""
    fi
done

echo ""
echo "✅ Great! You’re in the correct directory."

# Ask for a folder name that exists inside SCRIPT_DIR
echo "📂 Now, can you name one folder that exists in this directory?"
echo "Use the 'ls' command in your second shell if you need to look."
echo ""
echo "Typing 'ls' in your shell will show the contents of your current working directory."
echo ""

foldername=""
while true; do
    read -p "🧠 Enter the name of one folder here: " foldername

    if [[ -d "$SCRIPT_DIR/$foldername" ]]; then
        echo "🎉 Correct! '$foldername' is a folder in this directory."
        break
    else
        echo ""
        echo "❌ '$foldername' is not a folder in this directory."
        echo "🔁 Use 'ls \"$SCRIPT_DIR\"' in your other shell to see what’s there."
        echo "(Press Ctrl+C to quit)"
        echo ""
    fi
done

foldername="some_data"
# Ask the user to list contents of a folder
echo "📘 Now let’s explore a folder using: ls <folder>"
echo ""
echo "🔍 To do this, run this code in your second shell:"
echo "    ls $foldername"
echo ""
echo "This will show the contents of the '$foldername' folder."
echo ""

itemname=""
while true; do
    read -p "🧠 Enter the name of one item inside '$foldername': " itemname

    if [[ -e "$SCRIPT_DIR/$foldername/$itemname" ]]; then
        echo "🎉 Yes! '$itemname' exists inside '$foldername'. Well done!"
        break
    else
        echo "❌ Hmm... '$itemname' doesn't seem to be in '$foldername'."
        echo "🔁 Try running: ls \"$foldername\" and check again."
    fi
done


}

# --- Part 2: Placeholder ---
part2() {
    echo ""
    echo "🧩 Part 2: Coming soon!"
    echo "huhu"
}

# --- Part 3: Placeholder ---
part3() {
    echo ""
    echo "🧩 Part 3: Coming soon!"
    echo "We’ll learn how to view file contents with 'cat', 'less', and more."
}

# --- Run all parts in order ---
run_all_parts() {
    echo "🚀 Starting full tuxtorial..."
    part1
    part2
    part3
    echo ""
    echo "🎓 All done! Great work!"
}

# --- Main logic ---
case "$1" in
    part1) part1 ;;
    part2) part2 ;;
    part3) part3 ;;
    --help|-h) print_help ;;
    --commands|--ref) print_commands ;;
    "") run_all_parts ;;
    *) echo "❓ Unknown option: $1"; print_help ;;
esac
