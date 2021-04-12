# SwiftRelinkPackage

This command line tool targets .xcodeproj files. It's purpose is to identify the package dependancies and change it's repo name and url accordingly.

# Setup

1. Clone the repo
```
git clone <this-repo>
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

Replace repository url of package dependancies. Use `--preview` to preview changes

### Changing repository base url

```
relink replace --help // open helper

relink replace --url <replacement-base-url> .../MyXcodeProject/MyXcodeProject.xcodeproj  --preview

relink replace --url <replacement-base-url> ../MyXcodeProject/MyXcodeProject.xcodeproj
```

### Formating package name 

You can add a prefix and suffix to the current name using the `--prefix` and `--suffix` options

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
