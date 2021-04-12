import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class ListApi {
    
    func listProjectPackages(path: String){
        let projectPath = Path(path)
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: projectPath)
        } catch {
            print("\(errorMessage: "Prasing project error")")
            return
        }
        
        let pbxproj = xcodeproj.pbxproj // Returns a PBXProj
        
        listProjectPackages(pbxproj: pbxproj)
    }
    
    func listProjectPackages(pbxproj: PBXProj){
        
        print("")
        
        guard let project = pbxproj.projects.first  else {
            print("\(errorMessage: "No project")")
            return
        }
        
        let packageCount = project.packages.count
        guard packageCount > 0 else {
            print("\(errorMessage: "No packges")")
            return
        }
        
        print("\(packageCount) Packages 📦", terminator: "\n\n")
        
        project.packages.enumerated().forEach { index, package in
            let packageName = package.name!
            print("📦 Package: \(packageName) - [\(index + 1)/\(packageCount)]")
        }
        print("")
    }
    
    func listProjectPackagesDetails(path: String){
        let projectPath = Path(path)
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: projectPath)
        } catch {
            print("\(errorMessage: "Prasing project error")")
            return
        }
        
        let pbxproj = xcodeproj.pbxproj // Returns a PBXProj
        
        listProjectPackagesDetails(pbxproj: pbxproj)
    }
    
    func listProjectPackagesDetails(pbxproj: PBXProj){
        
        print("")
        
        guard let project = pbxproj.projects.first else {
            print("\(errorMessage: "No project")")
            return
        }
        
        let packageCount = project.packages.count
        guard packageCount > 0 else {
            print("\(errorMessage: "No packges")")
            return
        }
        
        print("\(packageCount) Packages 📦", terminator: "\n\n")
        
        project.packages.enumerated().forEach { index, package in
            let packageName = package.name!
            let repositoryURL = package.repositoryURL!
            let versionRequirement = package.versionRequirement!
            
            print("📦 Package: \(packageName) - [\(index + 1)/\(packageCount)]")
            print("🔗 repositoryURL: \(repositoryURL)")
            print("⛳ versionRequirement: \(versionRequirement)", terminator: "\n\n")
        }
        print("")
    }
    

}
