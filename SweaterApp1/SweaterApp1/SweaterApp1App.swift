//
//  SweaterApp1App.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.
//

import SwiftUI

@main
struct SweaterApp1App: App {
    @StateObject var cartManager = CartManager()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}
