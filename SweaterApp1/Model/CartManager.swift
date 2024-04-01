//
//  CartManager.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.


import Foundation

class CartManager: ObservableObject {
    @Published var products: [Product] = []
    @Published var total: Int = 0
    @Published var cartQuantity: Int = 0

    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false

    var numberOfProducts: Int {
        return products.count
    }

    func addToCart(product: Product, quantity: Int) {
        for _ in 0..<quantity {
            products.append(product)
            total += product.price
            cartQuantity += 1
        }
    }

    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            let removedProduct = products.remove(at: index)
            total -= removedProduct.price
            cartQuantity -= 1
        }
    }

    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = []
            self.total = 0
            self.cartQuantity = 0
        }
    }
}
