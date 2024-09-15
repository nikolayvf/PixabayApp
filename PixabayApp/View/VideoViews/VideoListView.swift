//
//  VideoListView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct VideoListView: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        NavigationStack {
            List(viewModel.videoState.videos) { video in
                HStack(spacing: 12) {
                    AsyncImage(url: URL(string: video.videos.tiny.thumbnail)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4) {
                        Text(video.tags)
                            .font(.headline)

                        Text("Uploaded by: \(video.user)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .onTapGesture {
                    viewModel.selectedVideoDetails = video
                }
            }
            .listStyle(PlainListStyle())
            .navigationDestination(isPresented: Binding<Bool>(
                get: { viewModel.selectedVideoDetails != nil },
                set: { newValue in
                    if !newValue {
                        viewModel.selectedVideoDetails = nil
                    }
                }
            )) {
                if let selectedVideo = viewModel.selectedVideoDetails {
                    VideoDetailsView(video: selectedVideo)
                }
            }
        }
    }
}
