//
//  FetchService.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

class FetchService: FetchServiceProtocol {
    private let apiKey = "45356457-706800fc581e8a74a7996bdc6"
    private let baseURL = "https://pixabay.com/api/"

    func getImages(query: String, page: Int, perPage: Int) async throws -> [ImageInfo] {
        let urlString = "\(baseURL)?key=\(apiKey)&q=\(query)&image_type=photo&page=\(page)&per_page=\(perPage)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let pixabayResponse = try JSONDecoder().decode(PixabayImageResponse.self, from: data)
        
        return pixabayResponse.hits
    }

    func getVideos(query: String, page: Int, perPage: Int) async throws -> [VideoInfo] {
        let urlString = "\(baseURL)videos/?key=\(apiKey)&q=\(query)&page=\(page)&per_page=\(perPage)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let pixabayResponse = try JSONDecoder().decode(PixabayVideoResponse.self, from: data)
        
        return pixabayResponse.hits
    }
}
