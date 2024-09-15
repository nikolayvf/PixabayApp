//
//  VideoViewState.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import Foundation

struct VideoViewState {
    var videos: [VideoInfo] = []
    var loading: Bool = false
    var error: String? = nil
}
