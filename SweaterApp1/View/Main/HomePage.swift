//
//  HomePage.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.


import SwiftUI

struct HomePage: View {

    @EnvironmentObject var cartManager: CartManager
    @State private var search: String = ""
    @State private var selectedIndex: Int = 0
    @State private var isDetailScreenPresented = false
    @State private var selectedProductIndex = 0

    private let categories = ["All", "Jumper", "Cardigan", "Crew neck", "Turtleneck", "Sweater vest", "Pullover"]

    var filteredProducts: [Product] {
        if selectedIndex == 0 {
            // If "All" is selected, filter by search text only
            if search.isEmpty {
                return productList
            } else {
                let lowercaseSearchText = search.lowercased()
                return productList.filter { $0.name.lowercased().contains(lowercaseSearchText) || $0.category.lowercased().contains(lowercaseSearchText) }
            }
        } else {
            // Filter by selected category and search text
            let selectedCategory = categories[selectedIndex]
            if search.isEmpty {
                return productList.filter { $0.category == selectedCategory }
            } else {
                let lowercaseSearchText = search.lowercased()
                return productList.filter { $0.category == selectedCategory && ($0.name.lowercased().contains(lowercaseSearchText) || $0.category.lowercased().contains(lowercaseSearchText)) }
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {

                        TagLineView()
                            .padding()

                        SearchAndScanView(search: $search)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<categories.count) { i in
                                    Button(action: { selectedIndex = i }) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }

                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color("Color1"))

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                
                                ForEach(filteredProducts.indices, id: \.self) { i in
                                    Button(action: {
                                        selectedProductIndex = i // Update selectedProductIndex here
                                        isDetailScreenPresented.toggle()
                                    }) {
                                        ProductCardView(product: filteredProducts[i], size: 210, selectedCategory: filteredProducts[i].category)
                                            .onTapGesture {
                                                selectedProductIndex = i // Also update selectedProductIndex here if necessary
                                                isDetailScreenPresented.toggle()
                                            }
                                    }
                                }


                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)

                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color("Color1"))

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                
                                ForEach(filteredProducts.indices, id: \.self) { i in
                                    Button(action: {
                                        selectedProductIndex = i // Update selectedProductIndex here
                                        isDetailScreenPresented.toggle()
                                    }) {
                                        ProductCardView(product: filteredProducts[i], size: 210, selectedCategory: filteredProducts[i].category)
                                            .onTapGesture {
                                                selectedProductIndex = i // Also update selectedProductIndex here if necessary
                                                isDetailScreenPresented.toggle()
                                            }
                                    }
                                }


                                .padding(.leading)
                            }
                        }
                    }
                    .padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .fullScreenCover(isPresented: $isDetailScreenPresented) {
            NavigationView {
                DetailScreen(selectedProduct: filteredProducts[selectedProductIndex], selectedCategory: categories[selectedIndex])
                    .environmentObject(cartManager)
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
        }

    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

 
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension View {

    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }

        return safeArea
    }
}
