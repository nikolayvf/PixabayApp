//
//  ImageDetailHelper.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

func detailsList(for image: ImageInfo) -> [(String, String, Bool)] {
    var details: [(String, String, Bool)] = []

    addDetail(&details, iconName: "eye.fill", text: "Views: \(image.views)")
    addDetail(&details, iconName: "arrow.down.circle.fill", text: "Downloads: \(image.downloads)")
    addDetail(&details, iconName: "heart.fill", text: "Likes: \(image.likes)")

    return details
}

private func addDetail(_ details: inout [(String, String, Bool)], iconName: String, text: String?, isLink: Bool = false) {
    if let text = text, !text.isEmpty {
        details.append((iconName, text, isLink))
    }
}
