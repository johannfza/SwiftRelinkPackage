import Foundation
import ArgumentParser
import PathKit
import XcodeProj

struct Options: ParsableArguments {
    @Argument(help: "Location of .xcodeProject file")
    public var path: String
}
