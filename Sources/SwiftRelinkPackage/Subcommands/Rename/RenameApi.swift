import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class RenameApi {
    
    let listApi = ListApi()
    
    func renamePackage(_ path: String, name: String, newName: String, preview: Bool){
        
        print("")
        if preview {
            print("[PREVIEW MODE]", terminator: "\n\n")
        }
        
        let projectPath = Path(path)
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: projectPath)
        } catch {
            print("\(errorMessage: "Parsing project error")")
            return
        }
        
        let pbxproj = xcodeproj.pbxproj // Returns a PBXProj
        
        guard let project = pbxproj.projects.first  else {
            print("\(errorMessage: "No project to relink")")
            exit(1)
        }
        
        let packagesCount = project.packages.count
        project.packages.enumerated().forEach { index, package in
            // Construct new bitbucket link
            if package.name == name {

                print("🎯 Package matches")
                package.repositoryURL = "http://google.\(newName)"

            }
        }

//            if omitExpression.matches(packageName){
//                print("🎯 Expression matches - Package excluded name change")
//                newPackageName = packageName
//            } else if packageName.hasSuffix(suffix) && changeSuffixEvenIfSuffixMatches != true {
//                print("🎯 Suffix matches - Only adding prefix")
//                newPackageName = formatPackageName(name: packageName, prefix: prefix, format: formatName)
//            } else {
//                newPackageName = formatPackageName(name: packageName, prefix: prefix, suffix: suffix, format: formatName)
//            }
//            let updatedURL = "\(baseUrl)\(newPackageName).git"
//            
////            if !preview {
////                // Edit project file
////                package.repositoryURL = updatedURL
////                package.versionRequirement = .branch("master")
////            }
//            
//            // Output
//            print("📦 Package: \(packageName) - [\(index + 1)/\(packagesCount)]")
//            print("✨ New Package Name: \(newPackageName)")
//            print("🔗 Repository URL: \(updatedURL)", terminator: "\n\n")
//        }
        
        if !preview {
            do {
                try xcodeproj.write(path: projectPath)
                print("🎉 Renaming done! 🍻", terminator: "\n\n")
                print("🔄 If you need to revert navigate to repo and use 'git restore \(projectPath)'", terminator: "\n\n")
            } catch {
                print("\(errorMessage: "Failed to write to file")")
                exit(1)
            }
        } else {
            print("🔭 [PREVIEW MODE]: That was just a preview no changes were made!")
        }
    }
    
}

