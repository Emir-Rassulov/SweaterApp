//
//  BottomNavBarItem.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.
//

import SwiftUI

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}

struct BottomNavBarItem_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavBarItem(image: Image(systemName: "star"), action: {})
    }
}
