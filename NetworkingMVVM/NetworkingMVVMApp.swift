//
//  NetworkingMVVMApp.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 16/08/2024.
//

import SwiftUI

@main
struct NetworkingMVVMApp: App {
    @StateObject private var productViewModel = ProductViewModel(productRepository: ProductRepository(productService: ProductService()))
        
        var body: some Scene {
            WindowGroup {
                ProductListView()
                    .environmentObject(productViewModel)
            }
        }
}
