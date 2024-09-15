//
//  PixabayImageResponse.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

struct PixabayImageResponse: Codable {
    let total: Int
    let totalHits: Int
    let hits: [ImageInfo]
}
