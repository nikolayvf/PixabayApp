//
//  ImageListView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct ImageListView: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        NavigationView {
            List(viewModel.state.images.indices, id: \.self) { index in
                let image = viewModel.state.images[index]
                NavigationLink(destination: ImageDetailsView(image: image)) {
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: image.previewURL)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(image.tags)
                                .font(.headline)
                            Text("Uploaded by: \(image.user)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical)
                }
                .onAppear {
                    if index == viewModel.state.images.count - 1 && !viewModel.state.loading {
                        Task {
                            await viewModel.handleIntent(.loadMoreImages)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Pixabay Images")
        }
    }
}
