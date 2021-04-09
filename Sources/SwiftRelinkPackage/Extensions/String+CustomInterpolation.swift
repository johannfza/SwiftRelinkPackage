extension String.StringInterpolation {
    
    mutating func appendInterpolation(errorMessage: String) {
        appendLiteral("Error: [\(errorMessage)]")
    }
    
    mutating func appendInterpolation(previewName: String) {
        appendLiteral("Package Name Preview: \(previewName)")
    }
}
