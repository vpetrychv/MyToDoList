//
//  BackgroundView.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 14/03/2026.
//

import SwiftUI

struct BackgroundView: View {
    
    //MARK: - Body
    var body: some View {
        LinearGradient(
            colors: [Color.tdBackgroundOne, Color.tdBackgroundTwo],
            startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
