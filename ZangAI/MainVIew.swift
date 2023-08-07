//
//  MainView.swift
//  QuzhatChat
//
//  Created by Nurgul Kozhakhmetova on 28.07.2023.
//

import SwiftUI

struct MainView: View {
    @State private var showChatView = false
    @Binding var selectedTab: Int
   
    var body: some View {
        NavigationView{
            VStack{
                
                ScrollView{
                    VCard()
                                        
                    Spacer()
                    VStack(spacing: 20){
                        Text("Дополнительно:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        ForEach(sections){ section in
                            HCard(section: section)
                        }
                    }
                    .padding(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .strokeBorder(.gray.opacity(0.3))
                    )
                    .padding()
                    .padding(.top, 30)
                }
                
                Text("Начать диалог")
                
                    .font(.system(size: 18))
                    .bold()
                    .onTapGesture {
                        selectedTab = 1
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(RoundedRectangle(cornerRadius: 30.0).fill(.teal))
                    .navigationBarTitle("Главная страница")
//                    .padding()
                
            }
            .ignoresSafeArea()
            .padding()
            .background(Color(red: 21/255, green: 20/255, blue: 25/255))
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView(selectedTab: .constant(1))
    }
}
