# Recursive File Search Shell Script

This Shell Script allows users to recursively search the content of all files within a specified directory. The script prompts the user to enter the directory name and the keyword to be searched. The following steps are performed:

### Function 1: Copying Files with Searched Keyword
This function creates a folder named "Found" and copies files containing the searched keyword into it. The script performs the following actions:

1. The "Found" folder is created if it doesn't exist.
2. Files containing the keyword are copied to the "Found" folder
3. During the copying process, the script renames the files to "found_<old_file_name>".
4. If files with the searched keyword are found, the user is informed by displaying the message: "Files were copied to the Found directory!" The script also lists the files present in the "Found" directory.
5. If the searched word is not found in any file, the user is informed by displaying the message: "Keyword not found in files!"


### Function 2: Displaying Modification Details
This function displays the last modified user and modification time details of the files found in the "Found" directory. The script performs the following actions:

It shows the last modified user and modification time details of each file found in the "Found" directory.
The output format is as follows:
```
File 1: found_file4.txt was modified by Huseyin on March 12, 2023 at 21.00.
File 2: found_file21.txt was modified by Altug on March 16, 2023 at 08.40.
```
Additionally, the script creates a file named "modification_details.txt" within the "Found" directory. This file contains the modification details listed in the previous step.

Note: The second function only works if the searched keyword is found in any of the files.
