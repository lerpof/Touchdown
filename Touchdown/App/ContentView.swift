//
//  ContentView.swift
//  Touchdown
//
//  Created by Leonardo Lazzari on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.getWindow()?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            // MARK: - Tab View section
                            FeaturedTabView()
                                .padding(.vertical, 20)
                                .frame(height: 300)
                            
                            // MARK: - Categories section
                            CategoryGridView()
                            
                            // MARK: - Helmets section
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                } //: FOREACH
                            } //: LAZYVGRID
                            .padding(15)
                            
                            // MARK: - Brands section
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                            
                            // MARK: - Footer section
                            FooterView()
                                .padding(.horizontal)
                        } //: VSTACK
                    } //: SCROLLVIEW
                    
                    
                } //: VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .environmentObject(Shop())
    }
}
