import Foundation
import ArgumentParser
import PathKit
import XcodeProj

extension Relink {
    struct List: ParsableCommand {
        
        public static let configuration = CommandConfiguration(abstract: "List packages")
        
        @OptionGroup var options: Options
        
        @Flag(name: .shortAndLong, help: "Get details of packages")
        private var details: Bool = false
        
        func run(){
            
            let listApi = ListApi()
            
            if details {
                listApi.listProjectPackagesDetails(path: options.path)
                return
            }
    
            listApi.listProjectPackages(path: options.path)
            
        }
        
    }
}
