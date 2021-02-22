//
//  VideoModel.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 22/2/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
