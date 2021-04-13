import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class RenameApi {
    
    let listApi = ListApi()
    
    func renamePackage(_ path: String, name: String, newName: String, preview: Bool){
        
        print("")
        if preview {
            print("\(previewMode: "")")
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
        
        guard project.packages.first(where: { $0.name == name}) != nil else {
            print("No package with name: \(name)")
            return
        }
        
        project.packages.enumerated().forEach { index, package in
            if package.name == name {
                print("🎯 A Package matches!")
                print("Renaming Package: \(name) to \(newName)")
                let urlNS = package.repositoryURL as NSString?
                let updatedURL = "\(urlNS?.deletingLastPathComponent ?? "default value")/\(newName).git"
                package.repositoryURL = updatedURL
                print("\(packageDetails: package.name!,newName,package.repositoryURL!)")
            }
            
        }

        if !preview {
            do {
                try xcodeproj.write(path: projectPath)
                print("\(successfulWriteAction: "Renaming", path: path)")
            } catch {
                print("\(errorMessage: "Failed to write to file")")
                exit(1)
            }
        } else {
            print("\(previewMode:"default")")
        }
    }
    
}

