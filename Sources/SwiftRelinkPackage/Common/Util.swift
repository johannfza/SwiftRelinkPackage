import Foundation
import ArgumentParser
import PathKit
import XcodeProj

public class Util {
    
    static func getPBXProjFrom(pathStr: String) -> PBXProj {
        let projectPath = Path(pathStr)
        return getPBXProjFrom(path: projectPath)
    }
    
    static func getProjectFrom(pbxproj: PBXProj) -> PBXProject {
        guard let project = pbxproj.projects.first  else {
            print("\(errorMessage: "No project")")
            exit(1)
        }
        if project.packages.count < 1  {
            print("\(errorMessage: "No packages")")
            exit(1)
        }
        return project
    }
    
    static func getProjectFrom(path: String) -> PBXProject {
        getProjectFrom(pbxproj: getPBXProjFrom(pathStr: path))
    }
    
    static func getPBXProjFrom(path: Path) -> PBXProj{
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: path)
        } catch {
            print("\(errorMessage: "Prasing project error")")
            exit(1)
        }

        return xcodeproj.pbxproj
    }
    
}
