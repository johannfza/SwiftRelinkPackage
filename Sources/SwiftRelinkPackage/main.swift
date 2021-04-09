import Foundation
import ArgumentParser
import PathKit
import XcodeProj

struct Relink: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Command line to to relink package links",
        subcommands: [Replace.self])
    
    @OptionGroup var options: Options
    
    //    @Argument(help: "Location of .xcodeProject file")
    //    private var path: String
    
    @Flag(name: .shortAndLong, help: "List package dependancies of this project")
    private var listpackages: Bool = false
    
    func run(){
        
        let projectApi = ProjectApi()
        
        if listpackages {
            projectApi.listProjectPackages(path: options.path)
            return
        }
    }
    
    init() { }
}

Relink.main()
