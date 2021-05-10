#!/bin/bash

#######################################
# Exit bash script with error message
# Arguments:
#   message
#######################################
function err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')] ERROR: $*" >&2
    echo "relink.sh help for helper"
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

# create local variable 
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

check_path_is_valid_xcodeproj $path

if ! command -v swift run relink &> /dev/null
then
    err "relink could not be found" "make sure relink is visible in this directory"
    exit 1
fi 

echo "relink installed"
echo "Starting relink"

# TODO(): 

exit 1