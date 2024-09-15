//
//  VideoDetailsView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI
import AVKit

struct VideoDetailsView: View {
    let video: VideoInfo
    @State private var player: AVPlayer?
    @State private var isLoading = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(video.tags)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                
                if let player = player {
                    VideoPlayer(player: player)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .onAppear {
                            player.play()
                        }
                        .onDisappear {
                            player.pause()
                        }
                } else {
                    ProgressView("Loading Video...")
                        .frame(height: 300)
                        .onAppear {
                            loadVideo()
                        }
                }

                HStack {
                    if let userImageURL = video.userImageURL, let url = URL(string: userImageURL) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    }
                    VStack(alignment: .leading) {
                        Text(video.user)
                            .font(.headline)
                        Text("Uploaded by: \(video.user)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                VStack(spacing: 8) {
                    HStack(spacing: 24) {
                        HStack {
                            Image(systemName: "eye.fill")
                            Text("\(video.views) views")
                        }
                        HStack {
                            Image(systemName: "square.and.arrow.down")
                            Text("\(video.downloads) downloads")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                    HStack(spacing: 24) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("\(video.likes) likes")
                        }
                        HStack {
                            Image(systemName: "text.bubble.fill")
                            Text("\(video.comments) comments")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Video Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func loadVideo() {
        guard let url = URL(string: video.videos.large.url) else {
            print("Invalid video URL")
            return
        }
        player = AVPlayer(url: url)
        isLoading = false
    }
}

