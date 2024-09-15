//
//  PixabayVideoResponse.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

struct PixabayVideoResponse: Codable {
    let total: Int
    let totalHits: Int
    let hits: [VideoInfo]
}

