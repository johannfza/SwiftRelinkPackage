import Foundation
import ArgumentParser
import PathKit
import XcodeProj

enum PackageNameFormat {
    case upper
    case lower
    case none
    
    init(_ string: String) throws {
        switch string {
        case "upper":
            self = .upper
        case "lower":
            self = .lower
        default:
            throw ValidationError("Please use value 'upper' or 'lower' to format string")
        }
    }
}
