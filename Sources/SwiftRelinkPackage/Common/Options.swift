import Foundation
import ArgumentParser
import PathKit
import XcodeProj

struct Options: ParsableArguments {
    @Argument(help: "Location of .xcodeProject file")
    public var path: String
    
    @Flag(name: .long, help: "See a preview of what might change")
    public var preview: Bool = false
}
