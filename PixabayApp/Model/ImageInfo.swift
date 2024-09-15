//
//  ImageInfo.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

struct ImageInfo: Codable, Identifiable {
    let id: Int
    let pageURL: String
    let type: String
    let tags: String
    let previewURL: String
    let previewWidth: Int
    let previewHeight: Int
    let webformatURL: String
    let webformatWidth: Int
    let webformatHeight: Int
    let largeImageURL: String
    let imageWidth: Int
    let imageHeight: Int
    let imageSize: Int
    let views: Int
    let downloads: Int
    let likes: Int
    let comments: Int
    let user: String
    let userImageURL: String
}
