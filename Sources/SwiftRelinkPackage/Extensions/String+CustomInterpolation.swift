import XcodeProj

extension String.StringInterpolation {
    
    mutating func appendInterpolation(errorMessage: String) {
        appendLiteral("Error: [\(errorMessage)]")
    }
    
    mutating func appendInterpolation(previewName: String) {
        appendLiteral("Package Name Preview: \(previewName)")
    }
    
    mutating func appendInterpolation(packageListItem name: String, index: Int, totalCount total: Int) {
        appendLiteral("š¦ Package: \(name) - [\(index + 1)/\(total)]")
    }
    
    mutating func appendInterpolation(packageDetailsItem name: String, index: Int, totalCount total: Int, url: String, versionRequirements: XCRemoteSwiftPackageReference.VersionRequirement) {
        appendLiteral("š¦ Package: \(name) - [\(index + 1)/\(total)]\nš Repository URL: \(url)\nš Version Requirement: \(versionRequirements)\n")
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
            boxes.append("š¦ ")
        }
        return boxes
    }
    
    mutating func appendInterpolation(newPackageDetails name: String,_ newName: String,_ urlString: String) {
        appendLiteral("š¦ Package: \(name)\nāØ New Package Name: \(newName)\nš New Repository URL: \(urlString)\n")
    }
    
    mutating func appendInterpolation(previewMode message: String = "") {
        if message.isEmpty {
            appendLiteral("š­ [PREVIEW MODE]\n")
        } else if message == "default"{
            appendLiteral("š­ [PREVIEW MODE]: That was just a preview, no changes were made!\n")
        } else {
            appendLiteral("š­ [PREVIEW MODE]: \(message)\n")
        }
    }
    
    mutating func appendInterpolation(target: String, message: String) {
        appendLiteral("šÆ \(target) matches - \(message)")
    }

    mutating func appendInterpolation(successfulWriteAction action: String, path: String) {
        appendLiteral("š \(action) done! š»\n\nš If you need to revert, navigate to repo and use 'git restore \(path)'\n")
    }
    
}
