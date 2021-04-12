import Foundation
import ArgumentParser
import PathKit
import XcodeProj

extension Relink {
    struct List: ParsableCommand {
        
        public static let configuration = CommandConfiguration(abstract: "List packages")
        
        @OptionGroup var options: Options
        
        func run(){
    
            let listApi = ListApi()
            listApi.listProjectPackages(path: options.path)
            
        }
        
    }
}
