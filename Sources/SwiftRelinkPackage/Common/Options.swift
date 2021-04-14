import Foundation
import ArgumentParser
import PathKit
import XcodeProj

struct Options: ParsableArguments {
    @Argument(help: "Location of project .xcodeProject file")
    public var path: String
    
    @Flag(name: .long, help: "Preview of what might change. No changes will be made.")
    public var preview: Bool = false
}
