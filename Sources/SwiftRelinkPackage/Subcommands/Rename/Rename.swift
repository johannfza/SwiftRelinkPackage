import Foundation
import ArgumentParser
import PathKit
import XcodeProj


extension Relink {
    struct Rename: ParsableCommand {
        
        public static let configuration = CommandConfiguration(abstract: "Rename package name")
        
        @Option(name: .shortAndLong, help: "Package to rename")
        private var name: String
        
        @Option(name: .long, help: "Name to rename to")
        private var newName: String
        
        @OptionGroup var options: Options
        
        func run(){
            let api = RenameApi()
            
            api.renamePackage(options.path, name: name, newName: newName, preview: options.preview)
            
        }
        
    }
}

