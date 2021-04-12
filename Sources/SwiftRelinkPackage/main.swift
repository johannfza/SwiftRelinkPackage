import Foundation
import ArgumentParser
import PathKit
import XcodeProj

struct Relink: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Command line to to relink package links",
        subcommands: [Replace.self, List.self, Add.self])

    
    init() { }
}

Relink.main()
