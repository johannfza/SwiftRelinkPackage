import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class AddApi {
    
    func addPackage(path: String, packageName: String, targetName: String, productName: String, baseUrl: String, preview: Bool = false){
        let projectPath = Path(path)
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: projectPath)
        } catch {
            print("\(errorMessage: "Prasing project error")")
            exit(1)
        }
        
        let pbxproj = xcodeproj.pbxproj // Returns a PBXProj
        
        guard let project = pbxproj.projects.first  else {
            print("\(errorMessage: "No project")")
            exit(1)
        }
        
        let packageCount = project.packages.count
        guard packageCount > 0 else {
            print("\(errorMessage: "No packges")")
            exit(1)
        }
        var baseUrl = baseUrl
        if !baseUrl.hasSuffix("/") {
            baseUrl.append("/")
        }
        
        let repositoryURL = "\(baseUrl)\(packageName)"
        
        do {
            let newPackage = try project.addSwiftPackage(repositoryURL: repositoryURL, productName: productName, versionRequirement: .branch("master"), targetName: targetName)
            print("📦 NEW Package: \(newPackage.name!) has been addded!")
        } catch {
            print("\(errorMessage: "Unable to add package")")
            exit(1)
        }
        
        project.packages.enumerated().forEach { index, package in
            let packageName = package.name!
            let repositoryURL = package.repositoryURL!
            let versionRequirement = package.versionRequirement!
            
            print("📦 Package: \(packageName) - [\(index + 1)/\(packageCount+1)]")
            print("🔗 repositoryURL: \(repositoryURL)")
            print("⛳ versionRequirement: \(versionRequirement)", terminator: "\n\n")
        }
        
        if !preview {
            do {
                try xcodeproj.write(path: projectPath)
                print("🎉 Package Added! 🍻", terminator: "\n\n")
                print("🔄 If you need to revert navigate to repo and use 'git restore \(projectPath)'", terminator: "\n\n")
            } catch {
                print("\(errorMessage: "Failed to write to file")")
                exit(1)
            }
        } else {
            print("🔭 [PREVIEW MODE]: That was just a preview no changes were made!")
        }
        
        print("")
    }
    
    
}


