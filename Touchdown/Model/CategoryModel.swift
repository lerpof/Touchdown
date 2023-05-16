//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Leonardo Lazzari on 04/05/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
