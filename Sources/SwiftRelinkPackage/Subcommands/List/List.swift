import Foundation
import ArgumentParser
import PathKit
import XcodeProj

extension Relink {
    struct List: ParsableCommand {
        
        public static let configuration = CommandConfiguration(abstract: "List packages")
        
        @OptionGroup var options: Options
        
//        @Flag(name: .shortAndLong, help: "List package dependancies of this project")
//        private var listpackages: Bool = false
        
        func run(){
    
            let listApi = ListApi()
            listApi.listProjectPackages(path: options.path)
            
        }
        
    }
}
