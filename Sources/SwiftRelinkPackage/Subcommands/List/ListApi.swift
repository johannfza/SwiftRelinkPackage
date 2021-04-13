import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class ListApi {
    
    func listProjectPackages(path: String){
        let pbxproj = Util.getPBXProgFromPath(path)
        listProjectPackages(pbxproj: pbxproj)
    }
    
    func listProjectPackages(pbxproj: PBXProj){
        print("")
        let project = Util.getProjectFromPBXProg(pbxproj)
        
        print("\(packageCount: project.packages.count)")
        
        project.packages.enumerated().forEach { index, package in
            print("\(packageListItem: package.name!, index: index, totalCount: project.packages.count)")
        }
        print("")
    }
    
    func listProjectPackagesDetails(path: String){
        let pbxproj = Util.getPBXProgFromPath(path)
        listProjectPackagesDetails(pbxproj: pbxproj)
    }
    
    func listProjectPackagesDetails(pbxproj: PBXProj){
        print("")
        let project = Util.getProjectFromPBXProg(pbxproj)
        
        print("\(packageCount: project.packages.count)")
        
        project.packages.enumerated().forEach { index, package in
            print("\(packageDetailsItem: package.name!, index: index, totalCount: project.packages.count, url: package.repositoryURL! ,versionRequirements:  package.versionRequirement!)")
        }
        print("")
    }
    

}
