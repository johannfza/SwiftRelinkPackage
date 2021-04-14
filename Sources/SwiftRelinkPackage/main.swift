import Foundation
import ArgumentParser
import PathKit
import XcodeProj

struct Relink: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A command line tool to link swift project with their packages",
        subcommands: [Replace.self, List.self, Add.self, Rename.self],
        helpNames: [.long, .customShort("?")])
    
    init() { }
}

Relink.main()
