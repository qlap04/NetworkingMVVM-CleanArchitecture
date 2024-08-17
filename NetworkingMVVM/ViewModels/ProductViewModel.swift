//
//  ProductViewModel.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 17/08/2024.
//

import Foundation

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String = ""
    
    private let productRepository: ProductRepositoryProtocol
    
    init(productRepository: ProductRepositoryProtocol) {
        self.productRepository = productRepository
    }
    
    func fetchProducts() async {
        do {
            let products = try await productRepository.getProducts()
            self.products = products
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    func addProduct(product: Product) async {
        do {
            let newProduct = try await productRepository.addProduct(product: product)
            self.products.append(newProduct)
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    func deleteProduct(productId: Int) async {
        do {
            try await productRepository.deleteProduct(productId: productId)
            self.products.removeAll { $0.id == productId }
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}

