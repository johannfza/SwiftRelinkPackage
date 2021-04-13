import Foundation
import ArgumentParser
import PathKit
import XcodeProj

public class Util {
    
    static func getPBXProgFromPath(_ path: String) -> PBXProj {
        let projectPath = Path(path)
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: projectPath)
        } catch {
            print("\(errorMessage: "Prasing project error")")
            exit(1)
        }
        
        return xcodeproj.pbxproj
    }
    
    static func getProjectFromPBXProg(_ pbxproj: PBXProj) -> PBXProject {
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
    
}
