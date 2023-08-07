//
//  SettingsView.swift
//  QuzhatChat
//
//  Created by Nurgul Kozhakhmetova on 28.07.2023.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing:20){
                ForEach(cardElements){ element in
                    Card(cardElement: element)
                }
                .navigationBarTitle("Настройки")
                .font(.system(size:15))
                ScrollView{}
            }
            .padding(30)
            .foregroundColor(Color(red: 29/255, green: 29/255, blue: 31/255))
//            .background(Color(red: 241/255, green: 239/255, blue: 231/255))
            .background(Color(red: 21/255, green: 20/255, blue: 25/255))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
