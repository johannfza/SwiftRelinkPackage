extension String.StringInterpolation {
    
    mutating func appendInterpolation(errorMessage: String) {
        appendLiteral("Error: [\(errorMessage)]")
    }
    
    mutating func appendInterpolation(previewName: String) {
        appendLiteral("Package Name Preview: \(previewName)")
    }
    
    mutating func appendInterpolation(packageDetails name: String,_ newName: String,_ urlString: String) {
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
    
    mutating func appendInterpolation(successfulWriteAction action: String, path: String) {
        appendLiteral("🎉 \(action) done! 🍻\n\n🔄 If you need to revert navigate to repo and use 'git restore \(path)'\n")
    }
    
}
