import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class ReplaceApi {
    
    let listApi = ListApi()
    
    func replaceAllPackageURLs(_ path: String, baseUrl: String, prefix: String?, suffix: String?, formatName: PackageNameFormat?, omitExpression: NSRegularExpression, preview: Bool = false, changeSuffixEvenIfSuffixMatches: Bool = false){
        
        print("")
        if preview {
            print("\(previewMode: "")")
        }
        
        print("⚙️ [USER CONFIG]")
        
        print("Base URL: \(baseUrl)")
        let prefix = (prefix ?? "").replacingOccurrences(of: "/", with: "")
        let suffix = (suffix ?? "").replacingOccurrences(of: "/", with: "")
        
        let previewName = "\(prefix)<package-name>\(suffix)"
        
        var baseUrl = baseUrl
        if !baseUrl.hasSuffix("/") {
            baseUrl.append("/")
        }
        
        let formatName = formatName ?? PackageNameFormat.none
        
        switch formatName {
        case .lower:
            print("\(previewName: previewName.lowercased())")
        case .upper:
            print("\(previewName: previewName.uppercased())")
        case .none:
            print("\(previewName:previewName)")
        }
        print("")
        
        let projectPath = Path(path)
        let xcodeproj: XcodeProj
        
        do {
            xcodeproj = try XcodeProj(path: projectPath)
        } catch {
            print("\(errorMessage: "Parsing project error")")
            return
        }
        
        let pbxproj = xcodeproj.pbxproj // Returns a PBXProj
        
        listApi.listProjectPackages(pbxproj: pbxproj)
        
        print("REPLACING... [BASE URL]: \(baseUrl)", terminator: "\n\n")
        
        guard let project = pbxproj.projects.first  else {
            print("\(errorMessage: "No project to relink")")
            exit(1)
        }
        
        project.packages.enumerated().forEach { index, package in
            // Construct new bitbucket link
            let packageName = package.name!
            var newPackageName: String = ""

            if omitExpression.matches(packageName){
                print("\(target: "Expression", message: "Package excluded name change")")
                newPackageName = packageName
            } else if packageName.hasSuffix(suffix) && changeSuffixEvenIfSuffixMatches != true {
                print("\(target: "Suffix", message: "Only adding prefix")")
                newPackageName = formatPackageName(name: packageName, prefix: prefix, format: formatName)
            } else {
                newPackageName = formatPackageName(name: packageName, prefix: prefix, suffix: suffix, format: formatName)
            }
            let updatedURL = "\(baseUrl)\(newPackageName).git"
            

            package.repositoryURL = updatedURL
            package.versionRequirement = .branch("master")

            // Output
            print("\(newPackageDetails: package.name!,newPackageName,package.repositoryURL!)")
        }
        
        if !preview {
            do {
                try xcodeproj.write(path: projectPath)
                print("\(successfulWriteAction: "Relinking", path: path)")
            } catch {
                print("\(errorMessage: "Failed to write to file")")
                exit(1)
            }
        } else {
            print("\(previewMode:"default")")
        }
    }
    
    func formatPackageName(name: String, prefix: String, suffix: String = "", format: PackageNameFormat) -> String {
        let name = "\(prefix)\(name)\(suffix)"
        switch format {
        case .lower:
            return "\(name.lowercased())"
        case .upper:
            return "\(name.uppercased())"
        case .none:
            return name
        }
    }
    
}
