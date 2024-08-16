//
//  Product.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 16/08/2024.
//

import Foundation

struct Product: Codable, Identifiable {
    var id: Int?
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
}

