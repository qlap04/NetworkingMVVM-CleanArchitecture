//
//  ProductListView.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 17/08/2024.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    
    var body: some View {
        NavigationView {
            List(productViewModel.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text("\(product.price, specifier: "%.2f") USD")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddProductView()) {
                        Text("Add")
                    }
                }
            }
            .onAppear {
                Task {
                    await productViewModel.fetchProducts()
                }
            }
        }
    }
}


#Preview {
    ProductListView()
}
