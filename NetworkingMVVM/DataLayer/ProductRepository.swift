//
//  ProductRepository.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 17/08/2024.
//

import Foundation

protocol ProductRepositoryProtocol {
    func getProducts() async throws -> [Product]
    func getProductDetail(productId: Int) async throws -> Product
    func addProduct(product: Product) async throws -> Product
    func updateProduct(productId: Int, product: Product) async throws -> Product
    func deleteProduct(productId: Int) async throws
}

class ProductRepository: ProductRepositoryProtocol {
    private let productService: ProductService
    
    init(productService: ProductService) {
        self.productService = productService
    }
    
    func getProducts() async throws -> [Product] {
        return try await productService.getProduct()
    }
    
    func getProductDetail(productId: Int) async throws -> Product {
        return try await productService.getProductDetail(productId: productId)
    }
    
    func addProduct(product: Product) async throws -> Product {
        return try await productService.addProduct(product: product)
    }
    
    func updateProduct(productId: Int, product: Product) async throws -> Product {
        return try await productService.updateProduct(productId: productId, product: product)
    }
    
    func deleteProduct(productId: Int) async throws {
        try await productService.deleteProduct(productId: productId)
    }
}

