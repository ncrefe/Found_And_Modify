#!/bin/bash

file_search() {
    # Get input from user
    echo "Enter the name of the directory: " 
    read DIRECTORY_NAME
    echo "Enter the keyword: "
    read KEYWORD

    # If user directly press enter script works on current directory
    if [ -z "$DIRECTORY_NAME" ]; then
            DIRECTORY_NAME="."
    fi

    # Keyword can not be null
    if [ -z "$KEYWORD" ]; then
    echo "The keyword can not be null."
    else

        # If Found folder does not exist then create
        if [ ! -d Found ]; then
            mkdir Found
        fi

        # Search and store the search result
        FILES=$(grep -rl "$KEYWORD" "$DIRECTORY_NAME")

        # Copy founded files and change their name
        if [ -n "$FILES" ]; then
            for FILE in $FILES; do
                cp "$FILE" Found/found_"$(basename "$FILE")"
            done
            echo "Files were copied to the Found directory!"
            ls Found
        else
            # If there is no founded files display information
            echo "Keyword not found in files!"
        fi
    fi
}

modification_details() {
    if [ -d Found ] && [ "$(ls -A Found)" ]; then
        
        # Hold index for printing "File <<index>>"
        INDEX=1
        for FILE in $FILES; do
            USER=$(stat -c "%U" "$FILE")
            MODIFIED_MONTH=$(date -d "@$(stat -c '%Y' $FILE)" '+%b %d')
            MODIFIED_YEAR=$(date -d "@$(stat -c '%Y' $FILE)" '+%Y')
            MODIFIED_HOUR=$(date -d "@$(stat -c '%Y' $FILE)" '+%T' | cut -d ":" -f 1-2)

            # Display in terminal and write it into modification_details.txt
            echo "File $INDEX: found_$(basename "$FILE") was modified by $USER on $MODIFIED_MONTH, $MODIFIED_YEAR at $MODIFIED_HOUR."
            echo "File $INDEX: found_$(basename "$FILE") was modified by $USER on $MODIFIED_MONTH, $MODIFIED_YEAR at $MODIFIED_HOUR." >> Found/modification_details.txt
            
            # Increment ındex
            ((INDEX=INDEX+1))
        done

    else 
        # This function only runs when keyword is found
        # But puting this echo function is a good practice
        echo "No files found in the Found directory!"
    fi
}

file_search

# Call the modification_details function if there are files in the Found folder
if [ -d Found ] && [ "$(ls -A Found)" ]; then
    modification_details
fi
