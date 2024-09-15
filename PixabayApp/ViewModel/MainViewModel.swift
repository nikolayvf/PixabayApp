//
//  MainViewModel.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    @Published var state = ImageViewState()
    @Published var videoState = VideoViewState()
    @Published var selectedImageDetails: ImageInfo?
    @Published var selectedVideoDetails: VideoInfo?
    var currentQuery: String? = nil
    var currentPage = 1
    var videoCurrentPage = 1
    
    let service: FetchServiceProtocol

    init(fetchService: FetchServiceProtocol = FetchService()) {
        self.service = fetchService
    }

    func handleIntent(_ intent: ImageIntent) {
        switch intent {
        case .getImages:
            Task { await getImages() }
        case .searchImages(let query):
            Task { await searchImages(query) }
        case .loadMoreImages:
            Task { await loadMoreImages() }
        }
    }

    func handleVideoIntent(_ intent: VideoIntent) {
        switch intent {
        case .getVideos:
            Task { await getVideos() }
        case .searchVideos(let query):
            Task { await searchVideos(query) }
        case .loadMoreVideos:
            Task { await loadMoreVideos() }
        }
    }

    func getImages() async {
        state.loading = true
        do {
            let images = try await service.getImages(query: "default_query", page: 1, perPage: 10)
            state.images = images
            currentPage = 1
            currentQuery = "default_query"
        } catch {
            handleError(error)
        }
        state.loading = false
    }

    func searchImages(_ query: String) async {
        state.loading = true
        currentQuery = query
        currentPage = 1
        do {
            let images = try await service.getImages(query: query, page: currentPage, perPage: 10)
            state.images = images
        } catch {
            handleError(error)
        }
        state.loading = false
    }

    func loadMoreImages() async {
        guard let query = currentQuery else { return }
        state.loading = true
        currentPage += 1
        do {
            let images = try await service.getImages(query: query, page: currentPage, perPage: 10)
            state.images += images
        } catch {
            handleError(error)
        }
        state.loading = false
    }

    func getVideos() async {
        videoState.loading = true
        do {
            let videos = try await service.getVideos(query: "default_query", page: 1, perPage: 10)
            videoState.videos = videos
            videoCurrentPage = 1
        } catch {
            handleError(error)
        }
        videoState.loading = false
    }

    func searchVideos(_ query: String) async {
        videoState.loading = true
        videoCurrentPage = 1
        do {
            let videos = try await service.getVideos(query: query, page: videoCurrentPage, perPage: 10)
            videoState.videos = videos
        } catch {
            handleError(error)
        }
        videoState.loading = false
    }

    func loadMoreVideos() async {
        guard let query = currentQuery else { return }
        videoState.loading = true
        videoCurrentPage += 1
        do {
            let videos = try await service.getVideos(query: query, page: videoCurrentPage, perPage: 10)
            videoState.videos += videos
        } catch {
            handleError(error)
        }
        videoState.loading = false
    }

    private func handleError(_ error: Error) {
        state.error = error.localizedDescription
        videoState.error = error.localizedDescription
        print("Error: \(error.localizedDescription)")
    }
}

