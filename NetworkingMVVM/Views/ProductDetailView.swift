//
//  ProductDetailView.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 17/08/2024.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .font(.largeTitle)
            Text("\(product.price, specifier: "%.2f") USD")
                .font(.title2)
            Text(product.description)
                .padding(.top)
            Spacer()
        }
        .padding()
        .navigationTitle("Product Detail")
    }
}

