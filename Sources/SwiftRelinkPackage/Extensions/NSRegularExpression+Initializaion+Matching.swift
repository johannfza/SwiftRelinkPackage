import Foundation
import ArgumentParser
import PathKit
import XcodeProj

extension NSRegularExpression {
    
    convenience init(_ pattern: String) throws {
        do {
            try self.init(pattern: pattern)
        } catch {
             throw ValidationError("Illegal regular expression")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
