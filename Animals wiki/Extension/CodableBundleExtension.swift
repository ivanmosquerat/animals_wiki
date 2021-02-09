//
//  CodableBundleExtension.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 9/2/21.
//

import Foundation

extension Bundle{
    
    func decode(_ file: String) -> [CoverImage]{
        
        // Locate json file.
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // Create a property for the data.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        // Create decoder
        let decoder = JSONDecoder()
        // Create a property for decoded data.
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode data from bundle.")
        }
        
        return loaded
    }
}
