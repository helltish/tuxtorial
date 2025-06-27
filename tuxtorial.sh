#!/bin/bash

# --- Help message ---
print_help() {
    echo "🧭 Usage: ./tuxtorial.sh [part]"
    echo ""
    echo "Available options:"
    echo "  part1         Navigating the file system"
    echo "  part2         Modifying the file system"
    echo "  part3         Text data and scripts"
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
    echo "Navigating the file system"
	echo "  pwd                          - Print the current working directory (absolute path)"
    echo "  ls                           - List files and directories in the current folder"
	echo "  ls <folder>                  - List files and directories in the given folder"
    echo "  cd                           - Go to your home directory (shortcut to ~)"
    echo "  cd <folder>                  - Move into a subdirectory (e.g., cd Documents)"
    echo "  cd ..                        - Move up one directory (to the parent folder)"
    echo ""
	echo "Modifying the file system"
	echo "  cp <source> <destination>     - Copy files or directories"
	echo "                                 Example: cp notes.txt backup.txt"
	echo "  mv <source> <destination>     - Move or rename files and directories"
	echo "                                 Example: mv old.txt new.txt"
	echo "  rm <file>                     - Remove (delete) a file"
	echo "                                 Example: rm unwanted.txt"
	echo "  mkdir <folder>                - Create a new directory"
	echo "                                 Example: mkdir new_folder"
	echo "  rm -r <folder>                - Remove a folder and all its contents (recursive)"
	echo "                                 Example: rm -r old_folder"

	
	echo "Reading text files"
	echo "  less          				  - View the contents of a file page by page"
    echo "  cat                           - Print the contents of a file to the terminal"
    echo "  zcat                          - Print the contents of a compressed (.gz) file"
    echo "  wc -l                         - Count the number of lines in a file"
    echo ""
    echo "Run ./tuxtorial.sh to continue the interactive tutorial."
    exit 0
}


run_cd_exercise() {
  local start_dir="$1"
  local target_dir="$2"
  shift 2  # shift the first two arguments so "$@" now contains all correct answers

  echo ""
  echo "💡 Exercise:"
  echo ""
  echo "1. Get to: $start_dir"
  echo "   (Use 'cd' to change and 'pwd' to check your current directory)"
  echo ""
  echo "2. Use 'cd' and the shortest RELATIVE path to get to: $target_dir"
  echo "   (Expected result of 'pwd': $target_dir)"
  echo ""

  while true; do
	echo "🧠 Enter the cd command you used to get"
	echo "     from $start_dir"
    read -p "     to $target_dir: " user_cmd

    for correct_cmd in "$@"; do
      if [[ "$user_cmd" == "$correct_cmd" ]]; then
        echo "✅ Correct! You're in the right folder using the right command. Great job!"
        echo ""
        return
      fi
    done
	
	echo "❌ That's not quite right. Try again. Remember: use a relative path from your current location."
    echo ""
  
  done
}

# ToDo:
# cp
# mv
# rm
# rm -r
# mkdir
# man command, command --help
# Probably get sections that you can choose: navigating file system (pwd, ls, ls <>, cd, cd .., cd <>),changing the file system (cp,mv, rm, mkdir, rm -r), process text data (read, wc -l) and start programs  
# 

clear
echo "Hi! My name is Tux! 🐧"
sleep 1

echo ""
echo "🖥 ️To go through this tutorial with me, please open a second terminal window"
echo "You'll run commands in that second terminal while keeping this one open for guidance."

# Getting script dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sleep 1

part1() {
echo ""
echo "========================================="
echo "🧩 Part 1: Navigating the file system"
echo "========================================="
echo ""
echo "What you see on your second terminal? It is a prompt"
echo ""
echo "In your terminal, the prompt is the line that appears before every command you type."
echo ""
echo "It usually looks something like this:"
echo "  alex@minty:~$"
echo ""
echo "Let's break that down:"
echo "  alex      - your username"
echo "  minty     - the name of your computer (hostname)"
echo "  ~         - your current directory (tilde means your home folder)"
echo "  $         - this symbol means you're a normal user (if you're root, it shows #)"
echo ""
echo "💬 The prompt is the terminal's way of saying: 'I'm ready — type your next command!'"
echo ""
echo "You don't need to type the prompt itself. You just type your command after it."
echo "For example, if you see:"
echo "  alex@minty:~$ pwd"
echo "You just type: pwd"
echo ""
read -p "👉 Press Enter to continue..." _

# Absolute path intro
echo ""
echo "📚 Understanding File Path Structure in Linux:"
echo ""
echo "🔹 Linux organizes files in a hierarchical structure, like a big tree."
echo "🔹 Everything starts from the root directory, written as just a single slash: /"
echo ""
echo "Examples of paths in Linux:"
echo "  /           → The root directory"
echo "  /home       → Where all users' home directories are stored"
echo "  /home/alex  → A specific user's personal directory"
echo "  /etc        → System configuration files"
echo ""
echo "Compared to Windows:"
echo "  - Windows uses drive letters, like C:\\ or D:\\"
echo "  - A path in Windows might look like: C:\\Users\\Alex\\Documents"
echo ""
echo "Key differences:"
echo "  - Linux uses slashes (/) — not backslashes (\\)"
echo "  - Linux has one filesystem starting from / — no drive letters"
echo "  - All folders are part of this single tree"
echo ""
read -p "👉 Press Enter to continue..." _

echo ""
echo "An absolute path tells you exactly where something is on the system, starting from the root directory (/)."
echo "It always starts with a slash (/), no matter where you are."
echo ""
echo "Examples:"
echo "  /home/alex/Documents"
echo "  /usr/bin/python"
echo ""
read -p "👉 Press Enter to continue..." _

# Absolute path with pwd
echo ""
echo "🧭 Let's learn how to find where you are in the filesystem!"

echo ""
echo "📘 Our first command: pwd"
echo "This command will output an absolute path to your current position in a file system (we will call this position a current working directory)"
echo ""
echo "In your second terminal enter a command:"
echo "🐧@🎓~$ pwd"
echo ""
echo "What is your current working directory?"

user_input=""
while true; do
    read -p "🧠 Enter your current working directory: " user_input

    if [[ -d "$user_input" ]]; then
        echo "✅ Well done!"
        break
    else
        echo "❌ The path you entered does not exist on your system. Try again!"
		echo "Hint: a path could look like /home/elephant"
    fi
done
read -p "👉 Press Enter to continue..." _

# chaning directories with cd
echo ""
echo "📘 Our next command: cd"
echo "You can 'jump' through the file system with the command cd (=change directory)."
echo "cd takes one optional argument: the path to the destination directory."
echo "Our destination is: ${SCRIPT_DIR}:"
echo ""
echo "Execute the following command in your second terminal:"
echo "🐧@🎓~$ cd ${SCRIPT_DIR}"
echo ""
read -p "👉 Press Enter to continue..." _

echo "cd normally does not give any output, it just does it´s work."
echo ""
echo "If you are getting errors executing this command, check the exact spelling! There are no spaces between the slashes (/) in Linux paths! No typos are allowed!"
echo ""
echo "Did you manage to execute the command without errors? Lets move on and check your position now! Lets get your current working directory. "

echo "Do you remember 'pwd' command? Run it again in your second terminal:"
echo "🐧@🎓~$ pwd"
echo ""

#Check if the user is in the same directory
user_in1=""
while [[ "$user_in1" != "$SCRIPT_DIR" ]]; do
    read -p "🧠 Enter the output of your pwd command: " user_in1

    if [[ "$user_in1" != "$SCRIPT_DIR" ]]; then
        echo ""
        echo "Please change your current working directory."
		echo "To do so use command cd (=change directory)"
		echo ""
		echo "Type in your second terminal:"
        echo "🐧@🎓~$ cd $SCRIPT_DIR"
        echo ""
		echo "Then run 'pwd' again."
        echo ""
    fi
done

echo "✅ Well done!"
read -p "👉 Press Enter to continue..." _

# cd without arguments
echo ""
echo "Running cd without any arguments will bring you to your user home directory"
echo "This is very useful if you are lost in the file system, and just want to 'get back home' :)"
echo ""
echo "🔍 Lets try just that, run this code in your second terminal:"
echo "🐧@🎓~$ cd"
echo ""

read -p "👉 Press Enter to continue..." _

command=""
while true; do
	echo "What is the command to check your current working directory? Run this command in your second terminal"
    read -p "🧠 Enter this command for me here (not the command output):" command

    if [[ "$command" == "pwd" ]]; then
		echo "✅ Correct! 'pwd' is the command that outputs your current working directory!"
		break
	else
        echo "❌ '$command' is not one of the commands we learned. Please try again!"
    fi
done

echo ""
echo "'cd' should have brought you to your home path"

user_input=""
while true; do
    read -p "🧠 Enter your home path (output of 'pwd' command): " user_input

    if [[ "$user_input" == "$HOME" ]]; then
        echo "✅ Correct! That is your home directory."
        break
    else
        echo "❌ Nope, that's not your home directory. Try again!"
    fi
done

read -p "👉 Press Enter to continue..." _
echo ""
echo "Now, wherever you are lets get back to the directory we will work from!"
echo "Get your current working directory. To do so, run 'pwd' in your second terminal"

#Check if the user is in the same directory
user_in1=""
while [[ "$user_in1" != "$SCRIPT_DIR" ]]; do
    read -p "🧠 Copy here the output of your command and press Enter: " user_in1

    if [[ "$user_in1" != "$SCRIPT_DIR" ]]; then
        echo ""
        echo "Please change your current working directory."
		echo "To do so use command cd (=change directory)"
		echo ""
		echo "Type in your second terminal:"
        echo "🐧@🎓~$ cd $SCRIPT_DIR"
        echo ""
		echo "Then run 'pwd' again and paste the result here."
        echo ""
    fi
done

echo ""
echo "✅ Great! You’re in the correct directory."
read -p "👉 Press Enter to continue..." _

# ls command
echo ""
echo "📘 Our next command: ls"

echo "Lets look around. What files and folders are there in our current working directory?"
echo "To do so, we will learn a new command: ls (= list directory)"
echo "Now, can you name one folder that exists in your current directory?"
echo ""
echo "Typing 'ls' in your terminal will show the contents of your current working directory."
echo ""

foldername=""
while true; do
    read -p "🧠 Enter the name of one folder here: " foldername

    if [[ -n "$foldername" && -d "$SCRIPT_DIR/$foldername" ]]; then
        echo "✅ Correct! '$foldername' is a folder in this directory."
        break
    else
        echo ""
        echo "❌ '$foldername' is not a folder in this directory."
        echo "Use 'ls $SCRIPT_DIR' in your second terminal to see what’s there."
        echo ""
    fi
done

read -p "👉 Press Enter to continue..." _

# Ask the user to list contents of a folder
echo ""
echo "Now let’s explore this folder using: ls <folder>"
echo "To do this, just exchange the placeholder <folder> with a folder name you want to examine."
echo "Execute this code in your second terminal:"
echo "🐧@🎓~$ ls $foldername"
echo ""
echo "This will show the contents of the '$foldername' folder."
echo "You can easily check the content of any folder on your system from your current position!"
echo ""

itemname=""
while true; do
    read -p "🧠 Enter the name of one item (folder or file) inside '$foldername': " itemname

    if [[ -e "$SCRIPT_DIR/$foldername/$itemname" ]]; then
        echo "✅ Yes! '$itemname' exists inside '$foldername'. Well done!"
        break
    else
        echo "❌ Hmm... '$itemname' doesn't seem to be in '$foldername'."
        echo "Try running: ls $foldername and check again."
    fi
done

read -p "👉 Press Enter to continue..." _

# Absolute and relative paths
echo ""
echo "📘 Absolute and relative paths"
echo ""
echo "As we have learned earlier, the absolute path always starts with a slash (/), no matter where you are."
echo ""
echo "Relative paths let you move from your current directory to another, without typing the full path."
echo ""
echo " Let's learn 3 important shortcuts:"
echo ""
echo "  .     means 'the current directory'"
echo "         → You usually won’t use it alone with cd, but it's useful in scripts or with './program.sh'"
echo ""
echo "  ..    means 'the parent directory'"
echo "         → It takes you one level up."
echo "         → You can chain it, like '../../..' to go up multiple levels."
echo ""
echo "  ~     means 'your home directory'"
echo "         → It's a shortcut to /home/your_username"
echo "         → 'cd ~' has the same effect as 'cd'"
echo ""
echo "Tip: Use 'pwd' at any time to check your current location (absolute path) or currect working directory."
read -p "👉 Press Enter to continue..." _

# autocompletion
echo ""
echo "📘 Autocompletion"
echo ""
echo "When you're typing a command in the terminal, you can press the TAB key to auto-complete filenames, folders, or commands!"
echo ""
echo "For example:"
echo ""
echo "In your second terminal get to $SCRIPT_DIR:"
echo "🐧@🎓~$ cd $SCRIPT_DIR"
echo ""
echo "Then type:"
echo "🐧@🎓~$ cd somb"
echo ""
echo "Then press the TAB key → it might complete to:"
echo "🐧@🎓~$ cd sombrero"
echo ""
echo "If multiple options are possible (like 'sombrero', 'some_data'), pressing TAB twice will show them."
echo ""
echo "Try it out in your second terminal now:"
echo "🐧@🎓~$ cd $SCRIPT_DIR"
echo "🐧@🎓~$ cd som"
echo ""
echo "Then press TAB twice (TAB TAB)"

read -p "👉 Press Enter to continue..." _
echo ""

while true; do
	echo "🧠 Name me one folder you autocomplete into from 'cd som'"
	read -p " Folder name: " foldername

	if [[ -d "$SCRIPT_DIR/$foldername" ]]; then
		echo "✅ Great! '$foldername' exists!"
		break
	else
		echo "❌ Hmm... '$foldername' doesn't seem to exist. Try again."	
	fi
done

echo ""
echo "Now use autocompletion to get to the end of a long folder structure starting from $SCRIPT_DIR/sombrero"
echo "In your second terminal type (DO NOT PRESS ENTER):"
echo "🐧@🎓~$ cd $SCRIPT_DIR/sombrero"
echo ""
echo "Press TAB as long as your path gets longer"

while true; do
	read -p "🧠 Copy and paste here the longest absolute path you could autocomplete from $SCRIPT_DIR/sombrero:" folderpath

	if [[ -d "$folderpath" && "${folderpath%/}" == "$SCRIPT_DIR/sombrero/just/a/very/long/path/of/subfolders" ]]; then
		echo "✅ Great! You dig atocompletion!"
		break
	else
		echo "❌ Hmm... '$folderpath' doesn't seem to exist. Try again."	
	fi
done
read -p "👉 Press Enter to continue..." _

# Exercises on cd relative path 
run_cd_exercise "$SCRIPT_DIR/some_data/more_data/raw_data" \
 "$SCRIPT_DIR/sombrero" \
  "cd ../../../sombrero" "cd ../../../sombrero/"

read -p "👉 Press Enter to go to the next exercise..." _

run_cd_exercise "$SCRIPT_DIR/sombrero" \
 "$SCRIPT_DIR/some_data/more_data/data_analysis" \
  "cd ../some_data/more_data/data_analysis" \
  "cd ../some_data/more_data/data_analysis/"

echo "🎉🎉🎉 Congratulations! You finished the tuxtorial part 'Navigating the file system'!"
}



part2() {
echo ""
echo "========================================="
echo "🧩 Part 2: Text data and scripts"
echo "========================================="
echo ""
echo "In Linux, almost everything is a file:"
echo "  • A text document is a file ✅"
echo "  • A folder is a special kind of file ✅"
echo "  • A script is a file ✅"
echo "  • Even commands like 'ls' are actually files stored somewhere on the system! ✅"
echo ""
echo "🔍 You can view and inspect many of these files using simple tools."
echo ""

echo "📘 less — View a file one page at a time"
echo "Use ↑ ↓ PageUp PageDown to navigate, and press 'q' to quit."
echo "'less' can read both plain text and compressed files"
echo ""
echo "Example:"
echo "🐧@🎓~$ less $SCRIPT_DIR/some_data/less_data/example.fastq"
echo "🐧@🎓~$ less $SCRIPT_DIR/some_data/less_data/example.fastq.gz"
echo ""
echo "Tip: you can also use relative paths! navigate with 'cd'"
read -p "👉 Try it now in another terminal, then press Enter to continue..." _

echo ""
echo "📘 cat — Print the whole file to the terminal"
echo ""
echo "Useful for small files — it just prints everything right away. Less practical for big files."
echo ""
echo "Example:"
echo "🐧@🎓~$ cat $SCRIPT_DIR/some_data/less_data/example.fastq"
echo ""
echo "Tip: you can also use relative paths! navigate with 'cd'"
read -p "👉 Try it now in another terminal, then press Enter to continue..." _
echo ""

echo "📘️ zcat — Print the contents of a compressed .gz file:"
echo ""
echo "Great for viewing large compressed files without unzipping them first."
echo ""
echo "Example:"
echo "🐧@🎓~$ zcat $SCRIPT_DIR/some_data/less_data/example.fastq.gz"

echo ""
echo "Tip: you can also use relative paths! navigate with 'cd'"
read -p "👉 Try it now in another terminal, then press Enter to continue..." _

echo ""
echo "wc -l — Count the number of lines in a file:"
echo "This tells you how many lines are in the file. Useful for checking file size."
echo ""
echo "Example:"
echo "🐧@🎓~$ wc -l $SCRIPT_DIR/some_data/less_data/example.fastq"
echo ""
echo "Tip: you can also use relative paths! navigate with 'cd'"
read -p "👉 Try it now in another terminal, then press Enter to continue..." _

numlines=""
while true; do
	read -p "🧠 Enter number of lines in $SCRIPT_DIR/some_data/less_data/example.fastq: " numlines

	if [[ "$numlines" == "1000" ]]; then
		echo "✅ This is correct!"
		break
	else
		echo "❌ Wrong! Try again."	
	fi
done
read -p "👉 Press Enter to continue..." _

echo "Example 2:"
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data/more_data/raw_data"
echo "🐧@🎓~$ wc -l reference.fasta"
echo ""

numlines=""
while true; do
	read -p "🧠 Enter number of lines in $SCRIPT_DIR/some_data/more_data/raw_data/reference.fasta: " numlines

	if [[ "$numlines" == "20" ]]; then
		echo "✅ This is correct!"
		break
	else
		echo "❌ Wrong! Try again."	
	fi
done
echo ""
echo "If you are here, raise your hand and say magic word 'Data formats' to your tutor. We will speak about it together!"
read -p "👉 Press Enter to continue..." _


# start bash scripts
echo ""
echo "📘 Running Programs from the Command Line"
echo ""
echo "In Linux, many programs can be started just by typing their name:"
echo "  • Examples: firefox, python3, nano, grep, ls"
echo ""
echo "These programs live in system folders like /usr/bin — you don’t need to go there!"
echo ""
echo "Most programs accept arguments (options and inputs):"
echo "  • For example: ls -l /home"
echo ""
echo "Many also support --help or -h to show usage info:"
echo "  • Try: ls --help"
echo ""

echo "Now let’s try a simple example — a simple program (Bash script) with arguments!"
echo ""
read -p "👉 Press Enter to continue..." _
echo ""
echo "The script is located at:"
echo "$SCRIPT_DIR/some_data/more_data/data_analysis/mini_fun.sh"
echo ""
echo "How to run it?"
echo ""
echo "🔹 ABSOLUTE PATH:"
echo "You can run the script from anywhere using the full path:"
echo "  $SCRIPT_DIR/some_data/more_data/data_analysis/mini_fun.sh -word Tux"
echo ""

echo "🔹 RELATIVE PATH:"
echo "If you are in: $SCRIPT_DIR/some_data/more_data"
echo "You can run it with:"
echo "  ./data_analysis/mini_fun.sh -number 8"
echo ""

echo "If you are in: $SCRIPT_DIR (the root of your project)"
echo "You can run it with:"
echo "  ./some_data/more_data/data_analysis/mini_fun.sh -word Penguin"
echo ""

echo "🔹 Error: Permission denied"
echo "If the script is not executable, make it so with:"
echo "  chmod +x some_data/more_data/data_analysis/mini_fun.sh"
echo ""


in_user=""
while true; do
	read -p "🧠 Enter the output of the mini_fun.sh if you input a number 1000: " in_user

	if [[ "$in_user" == "250.00" ]]; then
		echo "✅ This is correct!"
		break
	else
		echo "❌ Wrong! Try again. Maybe float numbers?"	
	fi
done
read -p "👉 Press Enter to continue..." _
echo ""

in_user=""
while true; do
	read -p "🧠 Enter the output of the mini_fun.sh if you input a -word bash: " in_user

	if [[ "$in_user" == "I love you, bash!" ]]; then
		echo "✅ This is correct!"
		break
	else
		echo "❌ Wrong! Try again. Maybe float numbers?"	
	fi
done
echo ""
echo "🎉🎉🎉 Congratulations! You finished the tuxtorial part 'Text data and scripts'!"


}

part3() {
echo ""
echo "========================================="
echo "🧩 Part 3: Modifying the file system"
echo "========================================="
echo ""

# 1. mkdir with rules what not to do and how not to name
echo "📘 Our next command: mkdir — Make a New Directory"
echo ""
echo "The command 'mkdir' stands for 'make directory'."
echo "It's used to create new folders in your file system."
echo ""

echo "Basic usage:"
echo "    mkdir <my_folder>"
echo "This creates a folder called 'my_folder' in your current directory."
echo ""

echo "Example:"
echo ""
echo "In your second terminal run the following:"
echo "🐧@🎓~$ cd $SCRIPT_DIR"
echo "🐧@🎓~$ mkdir projects"
echo "🐧@🎓~$ cd projects"
echo "🐧@🎓~$ mkdir demo"
echo "Now you've created a folder 'projects', entered it, and created another folder inside called 'demo'."
read -p "👉 Try it now in another terminal, then press Enter to continue..." _

echo ""
echo "Naming Rules for Directories:"
echo "✅ You can use:"
echo "   - Letters (A–Z, a–z)"
echo "   - Numbers (0–9)"
echo "   - Underscores (_) and hyphens (-)"
echo "   - Dots (.) (but be careful — folders starting with a dot are hidden!)"
echo ""

echo "🚫 Avoid using:"
echo "   - Spaces (use underscores or quotes if you must)"
echo "     e.g., mkdir 'my folder with spaces'"
echo "   - Special characters like: / \\ * ? < > | \" ' ; : ! &"
echo "   - Characters that may be reserved by the shell or your operating system"
echo ""

echo "Tip: Use 'ls' to check if your new folder was created!"
echo ""

read -p "👉 Press Enter to continue..." _

echo ""
echo "The Power of the Command Line is creating folders quicker than in graphical user interfaces!"
echo ""
echo "With one command, you can create multiple folders or even whole folder trees!"
echo ""

echo "Create multiple folders side by side:"
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data"
echo "🐧@🎓~$ mkdir apples bananas oranges"
echo ""
echo "This will create three folders in your current directory:"
echo "    ./apples  ./bananas  ./oranges"
echo ""
echo "Then run: ls"
echo "You'll see your new folders listed."
echo ""
read -p "👉 Try it now in the second terminal, then press Enter to continue..." _

echo ""
echo "Create nested folders in one command using -p:"
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data"
echo "🐧@🎓~$ mkdir -p projects/2025/June/code"
echo ""
echo "This will create the full folder tree at once:"
echo "    ./projects"
echo "        └── 2025"
echo "            └── June"
echo "                └── code"
echo ""
echo "No need to create one folder at a time!"
echo ""

echo "💡 Why use -p?"
echo "    - It creates parent folders as needed."
echo "    - It won’t complain if parts of the path already exist."
echo ""

read -p "👉 Try it in a second terminal, then press Enter to continue..." _

# mkdir exercise
echo ""
echo "💡 Exercise:"
echo ""
echo "1. Get to: $SCRIPT_DIR/sombrero/just/a/very/long"
echo "   (Use 'cd' to change and 'pwd' to check your current directory)"
echo ""
echo "2. Use 'mkdir' and the shortest RELATIVE path to create a folder: $SCRIPT_DIR/sombrero/small"
echo "   (Expected result of 'pwd': $SCRIPT_DIR/sombrero/small)"
echo ""

correct_cmd="mkdir ../../../../small"
while true; do
	echo "🧠 Enter the command you used to create"
	echo "     a folder $SCRIPT_DIR/sombrero/small"
	read -p "     from a folder $SCRIPT_DIR/sombrero/just/a/very/long: " user_cmd

    if [[ "$user_cmd" == "$correct_cmd" ]]; then
      echo "✅ Correct! You're created a right folder using the right command. Great job!"
      echo ""
	  break
    fi
	
	echo "❌ That's not quite right. Try again. Remember: use a relative path from your current location."
	echo ""
done

read -p "👉 Press Enter to continue..." _

# rm and rm -r
echo ""
echo "📘 Removing Files and Folders: rm and rm -r"
echo ""
echo "The command 'rm' stands for 'remove'. It's used to delete files."
echo "Be careful: files deleted with 'rm' are NOT moved to Trash — they are permanently deleted!"
echo ""

echo "Removing a single file:"
echo "    rm old_notes.txt"
echo "This will delete the file 'old_notes.txt' from the current directory."
echo ""

echo "Remove a folder and everything inside it:"
echo "    rm -r my_folder"
echo "The '-r' flag means 'recursive' — it deletes the folder AND all its contents."
echo ""

echo "Tips:"
echo "✅ Always double-check the folder or file name before running rm!"
echo "✅ If you're unsure, use 'ls' first to see what's inside."
echo ""
echo "🚫 Avoid running dangerous patterns like: rm -r *"
echo "   (This can delete EVERYTHING in your current folder!)"
echo ""

echo "Example:"
echo "🐧@🎓~$ cd $SCRIPT_DIR"
echo "🐧@🎓~$ mkdir temp_folder"
echo "🐧@🎓~$ ls temp_folder"
echo "🐧@🎓~$ mkdir temp_folder/bla temp_folder/blu"
echo "🐧@🎓~$ ls temp_folder"
echo "🐧@🎓~$ rm -r temp_folder"
echo ""
echo "This will first create and then delete the entire 'temp_folder' and both subfolders inside it."
echo ""
read -p "👉 Try it in a second terminal, then press Enter to continue..." _

echo ""
echo "💡 Exercise:"
echo ""
echo "Now clean up your mess!"
echo "Find the folders you created before and delete them!"
echo ""
read -p "👉 Press Enter to continue..." _

# cp 
echo ""
echo "📘 Copying files: cp"
echo ""

echo "The 'cp' command is used to copy files or folders from one place to another."
echo ""

echo "Example:"
echo "Lets copy the reference.fasta:"
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data/more_data/raw_data"
echo "🐧@🎓~$ cp reference.fasta reference_copy.fasta"
echo ""
read -p "👉 Try it in a second terminal, then press Enter to continue..." _

echo ""
echo "Lets backup a very important report by putting its copy from folder 'reports' into a folder 'backups'"
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data/more_data/reports"
echo "🐧@🎓~$ cp report_very_important.txt ../backups/report_very_important_backup.txt"
echo ""
read -p "👉 Try it in a second terminal, then press Enter to continue..." _

echo ""
echo "'cp -r' lets you copy folders and their contents recursively."
echo ""
echo "Example:"
echo "Lets backup the whole reports folder (we will copy the whole folder to 'backups')"
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data/more_data"
echo "🐧@🎓~$ cp -r reports/ backups/"
echo ""
read -p "👉 Try it in a second terminal, then press Enter to continue..." _


# mv (also rename)
echo ""
echo "📘 Moving (or renaming) files: mv"
echo "The 'mv' command is used to move or rename files and folders."
echo ""

echo "Example renaming:"
echo "That report was not so important after all..."
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data/more_data/reports"
echo "🐧@🎓~$ mv report_very_important.txt report_unimportant.txt"
echo ""
read -p "👉 Try it in a second terminal, then press Enter to continue..." _
echo ""

echo "'mv' can move multiple files at once into a folder:"
echo "Lets move all our reports into the 'archive':"
echo "🐧@🎓~$ cd $SCRIPT_DIR/some_data/more_data/reports"
echo "mv *.txt ../archives"
echo ""
read -p "👉 Try it in a second terminal, then press Enter to continue..." _
echo ""
echo "🎉🎉🎉 Congratulations! You finished the tuxtorial part 'Modifying the file system'!"
}


# --- Run all parts in order ---
run_all_parts() {
    echo "🚀 Starting full tuxtorial..."
    part1
	read -p "👉 Press Enter to continue with the next part!..." _
    part2
    read -p "👉 Press Enter to continue with the next part!..." _
	part3
    echo ""
    echo "🎓 You have finished the complete tuxtorial! Great work!"
	# echo "huhu 🎉👉 🔁 🔑 🤔 📁 ⚠️ 🛠"

}

from_part2() {
    part2
    read -p "👉 Press Enter to continue with the next part!..." _
	part3
    echo ""
    echo "🎓 You have finished the complete tuxtorial! Great work!"
	# echo "huhu 🎉👉 🔁 🔑 🤔 📁 ⚠️ 🛠"

}


# --- Main logic ---
case "$1" in
    part1) run_all_parts ;;
    part2) from_part2 ;;
    part3) part3 ;;
    --help|-h) print_help ;;
    --commands|--ref) print_commands ;;
    "") run_all_parts ;;
    *) echo "Unknown option: $1"; print_help ;;
esac
