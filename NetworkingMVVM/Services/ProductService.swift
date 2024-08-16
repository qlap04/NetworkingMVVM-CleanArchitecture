//
//  ProductService.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 16/08/2024.
//

import Foundation

struct ProductService {
    
    func getProduct() async throws -> [Product] {
        guard let url = URL(string: " \(Globals.baseURL) + \(Globals.product)") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodingFailed
        }
        
        return products
    }
    
    func getProductDetail(productId: Int) async throws -> Product {
        guard let url = URL(string: "\(Globals.baseURL) + \(Globals.product) + \(productId)") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        guard let product = try? JSONDecoder().decode(Product.self, from: data) else {
            throw NetworkError.decodingFailed
        }
                
        return product
    }
    
    func getCategories() async throws -> [String] {
        guard let url = URL(string: "\(Globals.baseURL)+\(Globals.category)") else {
            throw NetworkError.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.requestFailed
            }
            
            guard let categories = try? JSONDecoder().decode([String].self, from: data) else {
                throw NetworkError.decodingFailed
            }
            return categories
        }
    
    func getProductsByCategory(category: String) async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products/category/\(category)") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodingFailed
        }
        return products
    }
    
    func addProduct(product: Product) async throws -> Product{
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.invalidURL
            }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "ContentType")
        
        //Ma hoa du lieu thanh JSON
        guard let jsonData = try? JSONEncoder().encode(product) else {
            throw NetworkError.encodingFailed
        }
        
        request.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        //check server request
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
           }
           
        guard let addedProduct = try? JSONDecoder().decode(Product.self, from: data) else {
               throw NetworkError.decodingFailed
           }
           
        return addedProduct
    }
    
    func updateProduct(productId: Int, product: Product) async throws -> Product{
        guard let url = URL(string: "https://fakestoreapi.com/products/\(productId)") else {
            throw NetworkError.invalidURL
        }
        
        //tao request
        var request = URLRequest(url: url)
        
        // thiet lap phuong thuc HTTP la PUT
        request.httpMethod = "PUT"
        
        //thiet lap HTTPHeaders
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //ma hoa du lieu thanh JSON
        
        guard let jsonData = try? JSONEncoder().encode(product) else {
            throw NetworkError.encodingFailed
        }
        
        //gan du lieu JSON vao body cua HTTP
        
        request.httpBody = jsonData
        
        // Bước 7: Sử dụng URLSession để gửi yêu cầu
        let (data, response) = try await URLSession.shared.data(for: request)
            
        // Bước 8: Kiểm tra phản hồi từ server
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
            }
            
        // Bước 9: Giải mã phản hồi từ server thành đối tượng Product
        guard let updatedProduct = try? JSONDecoder().decode(Product.self, from: data) else {
            throw NetworkError.decodingFailed
            }
        return updatedProduct
    }
}
