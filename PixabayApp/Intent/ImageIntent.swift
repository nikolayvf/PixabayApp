//
//  ImageIntent.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

enum ImageIntent {
    case getImages
    case searchImages(query: String)
    case loadMoreImages
}
