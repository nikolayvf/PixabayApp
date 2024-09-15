//
//  ImageHelperView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct ImageHeaderView: View {
    let image: ImageInfo

    var body: some View {
        VStack(spacing: 16) {
            if let url = URL(string: image.userImageURL) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 120, height: 120)
                .padding(.top, 20)
            }

            Text(image.user)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.primary)
                .padding(.top, 10)
        }
    }
}
