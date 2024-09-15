//
//  ImageDetailsView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct ImageDetailsView: View {
    let image: ImageInfo
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                AsyncImage(url: URL(string: image.largeImageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(maxWidth: .infinity)

                ImageHeaderView(image: image)
                ImageDetailsListView(image: image)
                ImageButtonsListView(image: image)
            }
        }
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        .navigationTitle("Image Details")
    }
}

