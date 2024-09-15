//
//  HomeView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: MainViewModel
    @State private var searchQuery = ""
    @State private var lastSearchQuery = ""
    
    var body: some View {
        TabView {
        
            // Image Search Tab
            NavigationView {
                VStack {
                    if viewModel.state.loading && viewModel.state.images.isEmpty {
                        ProgressView()
                    } else if let error = viewModel.state.error {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        ImageListView(viewModel: viewModel)
                    }
                }
                .navigationTitle("Pixabay Images")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchQuery)
                .onChange(of: searchQuery) {
                    viewModel.handleIntent(.searchImages(query: searchQuery))
                }
            }
            .tabItem {
                Label("Images", systemImage: "photo")
            }

            // Video Search Tab
            NavigationView {
                VStack {
                    if viewModel.videoState.loading && viewModel.videoState.videos.isEmpty {
                        ProgressView()
                    } else if let error = viewModel.videoState.error {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        VideoListView(viewModel: viewModel)
                    }
                }
                .navigationTitle("Pixabay Videos")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchQuery)
                .onChange(of: searchQuery) {
                    viewModel.handleVideoIntent(.searchVideos(query: searchQuery))
                }
            }
            .tabItem {
                Label("Videos", systemImage: "video")
            }
        }
    }
}
