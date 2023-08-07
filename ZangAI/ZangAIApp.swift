//
//  ZangAIApp.swift
//  ZangAI
//
//  Created by Nurgul Kozhakhmetova on 05.08.2023.
//

import SwiftUI

@main
struct ZangAIApp: App {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
