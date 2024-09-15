//
//  FetchServiceProtocol.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

protocol FetchServiceProtocol {
    func getImages(query: String, page: Int, perPage: Int) async throws -> [ImageInfo]
    func getVideos(query: String, page: Int, perPage: Int) async throws -> [VideoInfo]
}
