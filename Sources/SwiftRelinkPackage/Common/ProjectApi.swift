import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class ProjectApi {
    
    func listProjectPackages(path: String){
        let projectPath = Path(path)
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: projectPath)
        } catch {
            print("\(errorMessage: "Prarsing project error")")
            return
        }
        
        let pbxproj = xcodeproj.pbxproj // Returns a PBXProj
        
        listProjectPackages(pbxproj: pbxproj)
    }
    
    func listProjectPackages(pbxproj: PBXProj){
        
        guard let project = pbxproj.projects.first  else {
            print("\(errorMessage: "No project to relink")")
            return
        }
        
        let packageCount = project.packages.count
        guard packageCount > 0 else {
            print("\(errorMessage: "No packges to relink")")
            return
        }
        
        print("\(packageCount) Packages 📦 to relink", terminator: "\n\n")
        
        project.packages.enumerated().forEach { index, package in
            let packageName = package.name!
            print("📦 Package: \(packageName) - [\(index + 1)/\(packageCount)]")
        }
        print("")
    }
}
