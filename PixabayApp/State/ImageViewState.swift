//
//  ImageViewState.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

struct ImageViewState {
    var images: [ImageInfo] = []
    var loading: Bool = false
    var error: String? = nil
}
