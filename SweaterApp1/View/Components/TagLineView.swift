//
//  TagLineView.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.
//

import SwiftUI

struct TagLineView: View {
    var body: some View {
        Text("Come to Life. \nCome to ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Color1"))
            + Text("Sweater!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Color1"))
    }
}

struct TagLineView_Previews: PreviewProvider {
    static var previews: some View {
        TagLineView()
    }
}
