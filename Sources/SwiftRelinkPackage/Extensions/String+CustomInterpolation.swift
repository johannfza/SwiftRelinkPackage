import XcodeProj

extension String.StringInterpolation {
    
    mutating func appendInterpolation(errorMessage: String) {
        appendLiteral("Error: [\(errorMessage)]")
    }
    
    mutating func appendInterpolation(previewName: String) {
        appendLiteral("Package Name Preview: \(previewName)")
    }
    
    mutating func appendInterpolation(packageListItem name: String, index: Int, totalCount total: Int) {
        appendLiteral("📦 Package: \(name) - [\(index + 1)/\(total)]")
    }
    
    mutating func appendInterpolation(packageDetailsItem name: String, index: Int, totalCount total: Int, url: String, versionRequirements: XCRemoteSwiftPackageReference.VersionRequirement) {
        appendLiteral("📦 Package: \(name) - [\(index + 1)/\(total)]\n🔗 Repository URL: \(url)\n⛳ Version Requirement: \(versionRequirements)\n")
    }
    
    mutating func appendInterpolation(packageCount count: Int) {
        if count == 1 {
            appendLiteral("\(count) Package \(generateBoxes(count))\n")
        } else {
            appendLiteral("\(count) Packages \(generateBoxes(count))\n")
        }
    }
    
    internal func generateBoxes(_ n: Int) -> String {
        var boxes = ""
        for _ in 0..<n {
            boxes.append("📦 ")
        }
        return boxes
    }
    
    mutating func appendInterpolation(newPackageDetails name: String,_ newName: String,_ urlString: String) {
        appendLiteral("📦 Package: \(name)\n✨ New Package Name: \(newName)\n🔗 New Repository URL: \(urlString)\n")
    }
    
    mutating func appendInterpolation(previewMode message: String = "") {
        if message.isEmpty {
            appendLiteral("🔭 [PREVIEW MODE]\n")
        } else if message == "default"{
            appendLiteral("🔭 [PREVIEW MODE]: That was just a preview, no changes were made!\n")
        } else {
            appendLiteral("🔭 [PREVIEW MODE]: \(message)\n")
        }
    }
    
    mutating func appendInterpolation(target: String, message: String) {
        appendLiteral("🎯 \(target) matches - \(message)")
    }

    mutating func appendInterpolation(successfulWriteAction action: String, path: String) {
        appendLiteral("🎉 \(action) done! 🍻\n\n🔄 If you need to revert, navigate to repo and use 'git restore \(path)'\n")
    }
    
}
