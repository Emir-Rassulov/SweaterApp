//
//  DetailScreen.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.


import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedColor: Color = Color.white
    @State private var quantity: Int = 0
    @State private var selectedProduct: Product
    let selectedCategory: String
   

    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg-1")
                ScrollView {
                    Image(selectedProduct.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)

                    DescriptionView(selectedColor: $selectedColor, product: selectedProduct, quantity: $quantity)
                }
                .edgesIgnoringSafeArea(.top)

                VStack {
                    Spacer()
                    HStack {
                        Text("$\(selectedProduct.price)")
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()

                        Button(action: {
                            cartManager.addToCart(product: selectedProduct, quantity: quantity)
                            quantity = 0 // Reset quantity after adding to cart
                        }) {
                            Text("Add to Cart")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Primary"))
                                .padding()
                                .padding(.horizontal, 8)
                                .background(Color.white)
                                .cornerRadius(10.0)
                        }
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Color1"))
                    .cornerRadius(60.0, corners: .topLeft)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss() }), trailing: Image("threeDot"))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back to Homepage")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .offset(x: 0, y: UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
        }
        .environmentObject(cartManager) // Pass the cartManager as an environment object
    }

    init(selectedProduct: Product, selectedCategory: String) {
        self._selectedProduct = State(initialValue: selectedProduct)
        self.selectedCategory = selectedCategory
    }
}


struct DescriptionView: View {
    @Binding var selectedColor: Color
    var product: Product?
    @Binding var quantity: Int // Add this binding for quantity

    var body: some View {
        VStack(alignment: .leading) {
            Text(product?.name ?? "Product Name")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)


            HStack(spacing: 4) {
                ForEach(0 ..< 5) { _ in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                    .foregroundColor(.black)
                Spacer()
            }

            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
                .foregroundColor(.black)
            Text(product?.description ?? "")
                .lineSpacing(8.0)
                .opacity(0.6)
                .foregroundColor(.black)

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Specifications")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Text(product?.specifications ?? "") // Fill out existing code
                        .opacity(0.6)
                        .foregroundColor(.black)
                }

                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                VStack(alignment: .leading) {
                    Text("Category")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Text(product?.category ?? "") // Fill out existing code
                        .opacity(0.6)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)

            HStack {
                VStack(alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    HStack {
                        ColorButton(color: Color.white, isSelected: selectedColor == Color.white) {
                            selectedColor = Color.white
                        }
                        ColorButton(color: Color.black, isSelected: selectedColor == Color.black) {
                            selectedColor = Color.black
                        }
                        ColorButton(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)), isSelected: selectedColor == Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1))) {
                            selectedColor = Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1))
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Button(action: {
                        if quantity > 0 {
                            quantity -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                    }
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)

                    Text("\(quantity)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)

                    Button(action: {
                        quantity += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("Color1"))
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg-1"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}

struct ColorButton: View {
    let color: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ColorDotView(color: color)
                .overlay(
                    Circle()
                        .strokeBorder(lineWidth: isSelected ? 3 : 0)
                        .foregroundColor(Color("Primary"))
                )
        }
    }
}

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners


    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(selectedProduct: productList[0], selectedCategory: "Default Category")
            .environmentObject(CartManager())
    }
}
