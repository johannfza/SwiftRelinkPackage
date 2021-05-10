#!/bin/bash

# arugment present validation 
function die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"
path=$1

echo "Relink Project @ $1"

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
function pathIsValid() {
  if [[ -d $path ]]
  then
    file_name=${path##*/}
    if [[ ! $file_name == *.xcodeproj ]]
    then 
      echo "not a valid XcodeProj"
      exit 1
    fi  
  else 
      echo "invalid path"
      exit 1
  fi 
  echo "$path is valid"
}


# pathIsValid

if ! command -v swift run relink &> /dev/null
then
    echo "relink could not be found"
    echo "make sure relink is visible in this directory"
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
swift run relink
exit 1

