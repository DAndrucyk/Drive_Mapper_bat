@echo off
setlocal enabledelayedexpansion
cls

rem Creating the start of the distribution list array. DLSI is starting at slot 1 (skipping 0 so it lines up with how people normally count)
set "DLSI=1"

rem Creating the end of the distribution list array. DLEI is the end of the distribution/security group array. Change 2 to however many drives you want to map
set "DLEI=2"

rem populating the distribution list array. update for used distribution lists
set DLArray[1]=Distribution list 1
set DLArray[2]=Distribution list 2

rem Creating the start of the drive mapping array. DSSI is starting at slot 1 (skipping 0 so it lines up with how people normally count)
set "DMSI=1"
 
rem Creating the end of the drive mapping array. DSEI is the end of the drive mapping array. Change 2 to however many drives you want to map
set "DMEI=4"

rem populating the drive mapping array
rem .path is the file path that you want to be mapped
rem .id needs to be the same as number as the array entry for the permission controlling distribution list
rem .Drive is the drive letter you wish to have the file path mapped to
set DMArray[1].Path=File Path 1
set DMArray[1].ID=1
set DMArray[1].Drive=z
set DMArray[2].Path=File Path 2
set DMArray[2].ID=1
set DMArray[2].Drive=y
set DMArray[3].Path=File Path 3
set DMArray[3].ID=2
set DMArray[3].Drive=y
set DMArray[4].Path=File Path 4
set DMArray[4].ID=2
set DMArray[4].Drive=z

 

rem loop to go through distribution lists
for /L %%i in (%DLSI%,1,%DLEI%) do (

                rem loop to go through drive mapping array
                for /L %%A in (!DMSI!,1,!DMEI!) DO (

                                rem checksto see if the user is a member of a specified group
                                For /f %%f in ('"net user !username! /domain | findstr /l !DLArray[%%i]!"') DO (
                                                rem if the user is in the specified group enters if statement
                                                rem if the drive id matches the distribution list number maps the drive
                                                rem code is set to attempt to map the drive first
                                                rem if the mapping fails, it will then delete what is mapped to that drive
                                                rem after it attempts to delete the drive it will attempt to remap the drive
                                                if %%i==!DMArray[%%A].ID! (
                                                                net use !DMArray[%%A].Drive!: "!DMArray[%%A].Path!" /persistent:yes || net use !DMArray[%%A].Drive!: /delete /yes && net use !DMArray[%%A].Drive!: "!DMArray[%%A].Path!" /persistent:yes

                                                )

                                )

                )

)