//
//  StatItem.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct StatItem: View {
    let iconName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(text)
        }
    }
}
