//
//  AnimalModel.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 11/2/21.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
