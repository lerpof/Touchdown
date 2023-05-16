//
//  Shop.swift
//  Touchdown
//
//  Created by Leonardo Lazzari on 04/05/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
