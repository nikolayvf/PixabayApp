//
//  VideoInfo.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

// VideoInfo.swift

import Foundation

struct VideoInfo: Codable, Identifiable {
    let id: Int
    let pageURL: String
    let type: String
    let tags: String
    let duration: Int
    let videos: VideoFormats
    let views: Int
    let downloads: Int
    let likes: Int
    let comments: Int
    let user_id: Int
    let user: String
    let userImageURL: String?
}

struct VideoFormats: Codable {
    let large: VideoFormat
    let medium: VideoFormat
    let small: VideoFormat
    let tiny: VideoFormat
}

struct VideoFormat: Codable {
    let url: String
    let width: Int
    let height: Int
    let size: Int
    let thumbnail: String
}
