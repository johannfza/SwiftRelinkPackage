//
//  File.swift
//  
//
//  Created by Johann Fong  on 15/4/21.
//

import Foundation

extension String {
    
    func isValidPackageURL() -> Bool {
        return self.hasPrefix("https://") || self.hasPrefix("http://") || self.hasPrefix("file://")
    }
}
