#!/bin/bash

#######################################
# Quit bash script with exit message
# Arguments:
#   message
#######################################
function err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')] ERROR: $*" >&2
    exit 1
}

# arugment present validation 
function die () {
    echo >&2 "$@"
    exit 1
}

if [[ ! "$#" -eq 3 ]] 
then 
  err "usage - bash relink.sh <path-to-xcodeproj-file> <branch> <domain-branch-optional>"
fi

# [ "$#" -eq 3 ] || leave "3 argument required, $# provided"

path=$1
branch=$2

if [ ! $3 ]
then 
  domain_branch="master"
else 
  domain_branch=$3 
fi

echo "path: $1"
echo "branch: $2"
echo "domain_branch: $domain_branch"

# function downloadRelink() {
#     echo "Downloading relink"
#     git clone https://github.com/johannfza/SwiftRelinkPackage.git
#     cd SwiftRelinkPackage
#     echo "relink installed"
#     cd ..
# }

#######################################
# Check if path is a valid XcodeProj
# Globals:
#   PATH
# Arguments:
#   Path to XcodeProj
#######################################
function check_path_is_valid_xcodeproj() {
  if [[ -d $path ]]
  then
    file_name=${path##*/}
    if [[ ! $file_name == *.xcodeproj ]]
    then 
      err "not a valid XcodeProj"
    fi  
  else 
      err "invalid path"
  fi 
  echo "$path is valid"
}

#######################################
# Check if path is a valid XcodeProj
# Globals:
#   PATH
# Arguments:
#   Path to XcodeProj
#######################################


check_path_is_valid_xcodeproj $path

if ! command -v swift run relink &> /dev/null
then
    err "relink could not be found" "make sure relink is visible in this directory"
    # echo "alternatively do you want to download relink?"
    # select yn in "Yes" "No"; do
    #     case $yn in
    #         Yes ) downloadRelink; break;;
    #         No ) echo "relink NOT installed"; exit;;
    #     esac
    # done
    # downloadRelink
    exit 1
fi 

echo "relink installed"
echo "Starting relink"
# Start herer 
exit 1