//
//  TopBarDetailView.swift
//  Touchdown
//
//  Created by Leonardo Lazzari on 04/05/23.
//

import SwiftUI

struct TopPartDetailView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    @State private var isAnimating = false
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            // MARK: - Price
            VStack(alignment: .leading, spacing: 6) {
                Text("Price")
                    .fontWeight(.semibold)
                Text((shop.selectedProduct ?? sampleProduct).formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            }
            .offset(y: isAnimating ? -50 : -75)
            
            Spacer()
            // MARK: - Photo
            Image((shop.selectedProduct ?? sampleProduct).image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0 : -35)
        } //: HSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimating.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
struct TopBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(Shop())
    }
}
