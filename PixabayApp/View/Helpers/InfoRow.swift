//
//  InfoRow.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import SwiftUI

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
        .padding(.vertical, 4)
    }
}
