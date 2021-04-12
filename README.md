# SwiftRelinkPackage

This command line tool targets .xcodeproj files. It's purpose is to identify the package dependancies and change it's repo name and url accordingly.

# Setup

1. `git clone <this-repo>`
2. `cd SwiftRelinkPackage`
3. `swift build -c release`
4. `relink --help` // Shows command line helper

# Usage


## List Dependancies 
List out packages dependancies used by the project 

```
relink list <project-path>

relink list ../MyXcodeProject/MyXcodeProject.xcodeproj 
```

## Replacing dependancy links 

List out packages dependancies used by the project 

```
relink replace 

relink list ../MyXcodeProject/MyXcodeProject.xcodeproj 
```

### Installing
Installing your command line tool. 

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
