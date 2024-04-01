//
//  SearchAndScanView.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.
//

import SwiftUI

struct SearchAndScanView: View {
    @Binding var search: String

    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)

                ZStack(alignment: .leading) {
                    if search.isEmpty {
                        Text("Search")
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                    TextField("", text: $search)
                        .foregroundColor(.black)
                }
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)

            Button(action: {}) {
                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 20))
                    .padding()
                    .background(Color("Color1"))
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchAndScanView_Previews: PreviewProvider {
    @State static var searchText: String = ""

    static var previews: some View {
        SearchAndScanView(search: $searchText)
    }
}


