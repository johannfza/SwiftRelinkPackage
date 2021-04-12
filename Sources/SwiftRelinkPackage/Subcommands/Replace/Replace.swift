import Foundation
import ArgumentParser
import PathKit
import XcodeProj


extension Relink {
    struct Replace: ParsableCommand {
        
        public static let configuration = CommandConfiguration(abstract: "Replaces package properties")
        
        @Option(name: .long, help: "The base url to replace package link with")
        private var url: String
        
        @Option(name: .shortAndLong, help: "Add this value to the prefix of the new package name")
        private var prefix: String?
        
        @Option(name: .shortAndLong, help: "Add this value to the suffix of the new package name")
        private var suffix: String?
        
        @Option(name: .shortAndLong, help: "Ommit the changing of name for packages that matches this regular expression", transform: NSRegularExpression.init)
        private var omitExpression: NSRegularExpression = NSRegularExpression()
        
        @Option(name: .shortAndLong, help: "Parses new package name to upper/lower case", transform: PackageNameFormat.init)
        private var formatName: PackageNameFormat = PackageNameFormat.none
        
        @Flag(name: .long, help: "If package has suffix that matches suffix still add suffix")
        private var changeSuffixEvenIfSuffixMatches: Bool = false
        
        @Flag(name: .long, help: "See a preview of what might change")
        private var preview: Bool = false
        
        @OptionGroup var options: Options
        
        func run(){
            let api = ReplaceApi()
            
            if NSURL(string: url) != nil {
                if preview {
                    api.replaceAllPackageURLs(options.path, baseUrl: url, prefix: prefix, suffix: suffix, formatName: formatName, omitExpression: omitExpression, preview: preview, changeSuffixEvenIfSuffixMatches: changeSuffixEvenIfSuffixMatches)
                } else {
                    api.replaceAllPackageURLs(options.path, baseUrl: url, prefix: prefix, suffix: suffix, formatName: formatName, omitExpression: omitExpression, changeSuffixEvenIfSuffixMatches: changeSuffixEvenIfSuffixMatches)
                }
            }
        }
        
    }
}
