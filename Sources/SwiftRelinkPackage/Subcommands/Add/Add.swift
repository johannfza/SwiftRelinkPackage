//
//  File.swift
//  
//
//  Created by Johann Fong  on 12/4/21.
//
import Foundation
import ArgumentParser
import PathKit
import XcodeProj

extension Relink {
    struct Add: ParsableCommand {
        
        public static let configuration = CommandConfiguration(abstract: "List packages")
        
        @OptionGroup var options: Options
        
        @Option(name: .long, help: "Name of package you want to add")
        private var packageName: String
        
        @Option(name: .long, help: "Name of product within the package you want to add")
        private var productName: String
        
        @Option(name: .long, help: "Name of target within the package you want to add")
        private var targetName: String
        
        @Option(name: .long, help: "The repository base url of the package you want to add")
        private var url: String
        
        func run(){
            
            if NSURL(string: url) != nil {
                let addApi = AddApi()
                addApi.addPackage(path: options.path, packageName: packageName,targetName: targetName, productName: productName, baseUrl: url, preview: options.preview)
            } else {
                print("Error parsing url")
            }
            
            
            
        }
        
    }
}
