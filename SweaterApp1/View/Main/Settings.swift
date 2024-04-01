//
//  Settings.swift
//  SweaterApp1
//
//  Created by Emir Rassulov on 18/03/2024.
//

import SwiftUI

struct Settings: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
        }
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
