//
//  Home.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String

    // Hiding Tab Bar...
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab){

                // Views...
                HomePage()
                    .tag("Home")

                Cart()
                    .tag("Cart")

                Settings()
                    .tag("Settings")

                Help()
                    .tag("Help")

                Notifications()
                    .tag("Notifications")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

