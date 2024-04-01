//
//  Product.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String
    var category: String
    var specifications: String

}

var productList = [Product(name: "Orange sweater", image: "sweater_1", price: 54, description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.",category: "Cardigan", specifications: "Long-sleeve crewneck sweater in baby cashmere."),

                   Product(name: "Red wine sweater", image: "sweater_2", price: 89,description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.", category: "Pullover", specifications: "Long-sleeve crewneck sweater in baby cashmere."),

                   Product(name: "Sand sweater", image: "sweater_3", price: 79, description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.", category: "Sweater vest", specifications: "Long-sleeve crewneck sweater in baby cashmere."),

                   Product(name: "Sea sweater", image: "sweater_4", price: 94, description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.", category: "Crew neck", specifications: "Long-sleeve crewneck sweater in baby cashmere."),

                   Product(name: "Cream sweater", image: "sweater_5", price: 99, description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.", category: "Turtleneck", specifications: "Long-sleeve crewneck sweater in baby cashmere."),

                   Product(name: "Beige sweater", image: "sweater_6", price: 65, description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.", category: "Pullover", specifications: "Long-sleeve crewneck sweater in baby cashmere."),

                   Product(name: "Grey sweater", image: "sweater_7", price: 54, description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.", category: "Cardigan", specifications: "Long-sleeve crewneck sweater in baby cashmere."),

                   Product(name: "Mink sweater", image: "sweater_8", price: 83, description: "The Johnson honeycomb knit sweater is based on a traditional fisherman’s knit. Featuring intricate all-over cables and moss stitch patterns this sweater is pleasing to the eye. Using only the finest British wool and knitted in our Leicestershire factory, it is warm and made to last.", category: "Jumper", specifications: "Long-sleeve crewneck sweater in baby cashmere.")]


