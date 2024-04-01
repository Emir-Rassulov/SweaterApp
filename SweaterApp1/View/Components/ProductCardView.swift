//
//  ProductCardView.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.



import SwiftUI

struct ProductCardView: View {
    let product: Product
    let size: CGFloat
    let selectedCategory: String

    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)

            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)

            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }

                Spacer()

                Text("$\(product.price)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }

        
            Text(selectedCategory)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 4)
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = productList[0]
        return ProductCardView(product: sampleProduct, size: 200, selectedCategory: "Placeholder Category")
    }
}
