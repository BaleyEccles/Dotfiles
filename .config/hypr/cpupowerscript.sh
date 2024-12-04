#!/bin/bash

# Define the commands and corresponding profile names
commands=("cpupower-gui pr Performance && echo 'performance'" "cpupower-gui pr Balanced && echo 'balanced'" "cpupower-gui pr Powersave && echo 'powersave'")
profiles=("Performance" "Balanced" "Powersave")

# File to store the index of the last executed command and current profile
state_file="/home/baley/.config/hypr/.script_state"

# Initialize state file if it doesn't exist
if [ ! -f "$state_file" ]; then
    echo "0 Performance" > "$state_file"
fi

# Read the last executed command index and current profile
read -r current_command_index current_profile < "$state_file"

# Increment the command index cyclically
current_command_index=$(( (current_command_index + 1) % ${#commands[@]} ))

# Execute the command corresponding to the current index
eval "${commands[$current_command_index]}"

# Update the state file with the new command index and current profile
echo "$current_command_index ${profiles[$current_command_index]}" > "$state_file"
