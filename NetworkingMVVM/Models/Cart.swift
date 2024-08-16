//
//  Cart.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 16/08/2024.
//

import Foundation

struct Cart: Codable, Identifiable {
    var id: Int?
    var userId: Int
    var date: String
    var products: [CartProduct]
}

struct CartProduct: Codable {
    var productId: Int
    var quantity: Int
}
