//
//  ImageButtonListView.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct ImageButtonsListView: View {
    let image: ImageInfo

    var body: some View {
        VStack(spacing: 12) {
            ForEach(buttonsList(for: image), id: \.0) { button in
                if let url = URL(string: button.2), !button.2.isEmpty {
                    Link(destination: url) {
                        HStack {
                            Image(systemName: button.0)
                                .foregroundColor(.primary)
                            Text(button.1)
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                } else {
                    HStack {
                        Image(systemName: button.0)
                            .foregroundColor(.secondary)
                        Text(button.1)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

func buttonsList(for image: ImageInfo) -> [(String, String, String)] {
    var buttons: [(String, String, String)] = []
    
    addButton(&buttons, iconName: "globe", text: "View on Pixabay", urlString: image.pageURL)
    addButton(&buttons, iconName: "person.fill", text: "Uploader Profile", urlString: image.userImageURL)
    
    return buttons
}

private func addButton(_ buttons: inout [(String, String, String)], iconName: String, text: String, urlString: String) {
    if !urlString.isEmpty {
        buttons.append((iconName, text, urlString))
    }
}
