import Foundation
import ArgumentParser
import PathKit
import XcodeProj


extension Relink {
    struct Rename: ParsableCommand {
        
        public static let configuration = CommandConfiguration(abstract: "Rename package name")
        
        @Option(name: .shortAndLong, help: "Package to rename")
        private var name: String
        
        @Option(name: .long, help: "New name of packages")
        private var newName: String
        
        @Option(name: .shortAndLong, help: "Branch name")
        private var branch: String = "master"
        
        @OptionGroup var options: Options
        
        func run(){
            let api = RenameApi()
            
            api.renamePackage(options.path, name: name, newName: newName, branch: branch)
            
        }
        
    }
}

