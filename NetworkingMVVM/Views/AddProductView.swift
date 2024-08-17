//
//  AddProductView.swift
//  NetworkingMVVM
//
//  Created by Phan Quốc Lập on 17/08/2024.
//

import SwiftUI

struct AddProductView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var description: String = ""
    @State private var category: String = ""
    @State private var image: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Product Details")) {
                TextField("Title", text: $title)
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                TextField("Description", text: $description)
                TextField("Category", text: $category)
                TextField("Image URL", text: $image)
            }
            
            Button(action: {
                guard let priceValue = Double(price) else { return }
                let newProduct = Product(id: nil, title: title, price: priceValue, description: description, category: category, image: image)
                
                Task {
                    await productViewModel.addProduct(product: newProduct)
                }
            }) {
                Text("Add Product")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Add Product")
    }
}


#Preview {
    AddProductView()
}
