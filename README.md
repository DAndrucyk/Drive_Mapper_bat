# [Drive_Mapper_bat](https://github.com/DAndrucyk/Multi_distro_checker_bat/releases/tag/Batch)
Drive mapping bat file for automatically checking permissions based on distribution/security groups.
This file will compare the loged in user's ID to see if they are a member of a specific group and will then map a coresponding drive for that user. This file is set up to allow for any number of groups and drives.

## Known issues
- Distribution/security groups can only have 25 characters for the compairison
- Tool may bring back false positives if the group name has other groups that start with the same name
  - Example:
  - If you are checking permissions on Group_Test, you may get a false positive if there is a group called Group_Test_Admins
  - If the user is in Group_Test_Admins and not in Group_Test, you may get a false positive
  - The script checks for the name Group_Test (in this example) and will see both groups and check both groups

## Installation
- Download the batch file to a location of your choice.
- Run the stand alone bat file to run the script. All prompts will be brought up in a command prompt window.

## Default directories
- Requires connecting to check distirubtion/security groups, so those will need to be available on the network.

## Configuration
- Additional configuration is required. Adjust the file as needed for your enviorment. See notes in the batch file or below for more information

### Distribution list Array
### 1) Starting/Ending array numbers for Distribution/Security group array
- By defaul the start of the array is set to 1 to be in line with how people normally count.
- DLSI is the starting point for the Distribution/Security group array.
- DLEI is the ending point for the Distribution/Security group array.
- If you leave the starting point at 1, the end point will be the total number of distribution/security groups you are using for permissions.

### 2) Distribution/Security groups in array
- There are two distribution/security group entries in the file by defaul.
- You can add or remove entires basied on your needs.
- DLArray[1] is the first item and each entry should have a different number (example: DLArray[2] is entry 2 and so on).

### 3) Starting/Ending array numbers for Drive Mapping array
- By defaul the start of the array is set to 1 to be in line with how people normally count.
- DMSI is the starting point for the Drive Mapping array.
- DMEI is the ending point for the Drive Mapping array.
- If you leave the starting point at 1, the end point will be the total number of Drive Mappings you are using.

### 4) Drive Mapping array updates
- There are 4 items in the array each with 3 different values assigned to each by defaul.
- DMArray[X].Path is the file path to be used for entry X
- DMArray[X].ID is the ID for entry X (This should be set to the array number for the controlling distirubion list)
- DMArray[X].Drive is the drive letter for entry X
- All entries for DMArray[X] need to have a value added for .Path .ID and .Drive

## Development notes
- There is no additional software requirements to use this script (other than having the distirubtion/security groups set up in your domain)
- At this point there are no current plans to update this file unless a feature is requested or discovered to be needed (10/22/2021)


## Usage
- Have the user double click on the icon and it will map their drives.
