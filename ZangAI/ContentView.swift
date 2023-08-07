//
//  ContentView.swift
//  QuzhatChat
//
//  Created by Nurgul Kozhakhmetova on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            ChatView()
                .tabItem{
                    Image(systemName: "plus.circle.fill")
            }
                .tag(1)
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                }
                .tag(2)
        }
        .onAppear () {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(.teal)
        .foregroundColor(Color(red: 29/255, green: 29/255, blue: 31/255))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    init() {
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.accentColor)]
            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.accentColor)]
        }
    static var previews: some View {
        ContentView()
    }
}
