import Foundation
import ArgumentParser
import PathKit
import XcodeProj

class ReplaceApi {
    
    let listApi = ListApi()
    
    func replaceAllPackageURLs(_ path: String, baseUrl: String, prefix: String?, suffix: String?, formatName: PackageNameFormat?, omitExpression: NSRegularExpression, preview: Bool = false){
        
        print("")
        if preview {
            print("[PREVIEW MODE]", terminator: "\n\n")
        }
        
        print("[USER CONFIG]")
        
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
        
        print("REPLACING... [BASE URL]:\(baseUrl)", terminator: "\n\n")
        
        guard let project = pbxproj.projects.first  else {
            print("\(errorMessage: "No project to relink")")
            exit(1)
        }
        
        let packagesCount = project.packages.count
        project.packages.enumerated().forEach { index, package in
            // Construct new bitbucket link
            let packageName = package.name!
            var newPackageName: String = ""
            
            if omitExpression.matches(packageName){
                print("🎯 Expression matches - Package excluded name change")
                newPackageName = packageName
            } else {
                newPackageName = formatPackageName(name: packageName, prefix: prefix, suffix: suffix, format: formatName)
            }
            let updatedURL = "\(baseUrl)\(newPackageName).git"
            
            if !preview {
                // Edit project file
                package.repositoryURL = updatedURL
                package.versionRequirement = .branch("master")
            }
            
            // Output
            print("📦 Package: \(packageName) - [\(index + 1)/\(packagesCount)]")
            print("✨ New Package Name: \(newPackageName)")
            print("🔗 Repository URL: \(updatedURL)", terminator: "\n\n")
        }
        
        if !preview {
            do {
                try xcodeproj.write(path: projectPath)
                print("🎉 Relinking done! 🍻", terminator: "\n\n")
                print("🔄 If you need to revert navigate to repo and use 'git restore \(projectPath)'", terminator: "\n\n")
            } catch {
                print("\(errorMessage: "Failed to write to file")")
                exit(1)
            }
        } else {
            print("🔭 [PREVIEW MODE]: That was just a preview no changes were made!")
        }
    }
    
    func formatPackageName(name: String, prefix: String, suffix: String, format: PackageNameFormat) -> String {
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
