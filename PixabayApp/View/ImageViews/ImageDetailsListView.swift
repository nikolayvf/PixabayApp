//
//  ImageDetailsListView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct ImageDetailsListView: View {
    let image: ImageInfo

    var body: some View {
        VStack(spacing: 16) {
            ForEach(imageDetailsList(for: image), id: \.0) { detail in
                HStack {
                    Image(systemName: detail.0)
                        .foregroundColor(.secondary)
                    Text(detail.1)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }

            HStack(spacing: 10) {
                Text("👁 \(image.views) views")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text("⬇️ \(image.downloads) downloads")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text("❤️ \(image.likes) likes")
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal, 20)
        }
        .padding()
    }
}

func imageDetailsList(for image: ImageInfo) -> [(String, String)] {
    return [
        ("tag.fill", "Tags: \(image.tags)"),
        ("person.fill", "Uploaded by: \(image.user)")
    ]
}

