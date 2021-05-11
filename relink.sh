#!/bin/bash

#######################################
# Exit bash script with error message
# Arguments:
#   message
#######################################
function err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')] ERROR: $*" >&2
    echo "'bash relink.sh help' for helper"
    exit 1
}

if [[ "$1" == "help" ]]
then 
  echo "USAGE: bash relink.sh <path-to-xcodeproj-file> <local-target-branch-optional> <domain-branch-optional>"
  exit 1
fi 

if [ ! $1 ] || [ ! $2 ] 
then 
  err "USAGE: bash relink.sh <path-to-xcodeproj-file> <local-target-branch-optional> <domain-branch-optional>"
fi

# create local variables
path=$1
if [ ! $2 ]
then 
  branch="master"
else 
  branch=$3 
fi

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