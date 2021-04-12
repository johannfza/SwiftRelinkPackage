# SwiftRelinkPackage

This command line tool targets .xcodeproj files. It's purpose is to identify the package dependancies and change it's repo name and url accordingly.

# Setup

1. Clone the repo
```
git clone https://github.com/johannfza/SwiftRelinkPackage.git
```
2. Navigate to folder
```
cd SwiftRelinkPackage
```
3. Build project
```
swift build -c release
```
4. Open helper
```
relink --help
```


# Usage


## List Dependancies 
List out packages dependancies used by the project 

```
relink list <project-path>

relink list ../MyXcodeProject/MyXcodeProject.xcodeproj 
```

## Replacing dependancy links 

Replace repository url of package dependancies. Use `--preview` to preview changes else just run with out `--preview` to write changes

### Changing repository base url

```
relink replace --help // open helper

relink replace --url <replacement-base-url> <project-path>  --preview

// Example:
relink replace --url https://gitlab.com/ ../MyXcodeProject/MyXcodeProject.xcodeproj --preview
```

### Formating package name 

You can add a prefix and suffix to the current name using the `--prefix` and `--suffix` options. Change the name to all uppper or lower case to by using the `-f` tag with value "upper" or "lower".

```
relink replace --url <replacement-base-url> -p <prefix> -s <-suffix> -f <format-name> <project-path>

relink replace --url <replacement-base-url> -p <prefix> -s <-suffix> -f <format-name> <project-path>

// Example:
relink replace --url https://gitlab.com/ -p new -s ending -f lower ../MyXcodeProject/MyXcodeProject.xcodeproj 
```

### Ommit changes to be made from certain paclages

You can ommit the name change to be done to certain packages but creating an execption rule using regex. User the `-o` tag and pass in a regex value. All package names that match, their names will not be formatted. 

Note: take note that repository url will still be changed 

```
relink replace --url <replacement-base-url> -p <prefix> -s <-suffix> -f <format-name> -o <regex> <project-path>

// Example:
// Do not format names of packages who's names contain swift 
relink replace --url https://gitlab.com/ -p new -s ending -f lower -o "^.*swift.*$" ../MyXcodeProject/MyXcodeProject.xcodeproj

```

### Installing
Installing as a command line tool. 

```
swift build -c release
cd .build/release
cp -f Relink /usr/local/bin/relink

```

### Package Dependancies
- [XcodeProj - XcodeProj is a library written in Swift for parsing and working with Xcode projects.](https://github.com/tuist/XcodeProj)
- [Swift Argument Parser](https://github.com/apple/swift-argument-parser.git)

### References

- [Installing your command line tool](https://www.swiftbysundell.com/articles/building-a-command-line-tool-using-the-swift-package-manager/#installing-your-command-line-tool)
- [Creating a command line tool using the Swift Package Manager](https://www.avanderlee.com/swift/command-line-tool-package-manager/)
