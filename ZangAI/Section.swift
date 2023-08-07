//
//  Section.swift
//  QuzhatChat
//
//  Created by Nurgul Kozhakhmetova on 05.08.2023.
//

import SwiftUI

struct Section: Identifiable{
    var id = UUID()
    var title: String
    var caption: String
//    var image: Image
}
var sections = [
    Section(title: "Составление документов", caption: "Coming soon..."),
    Section(title: "Анализ документов", caption: "Coming soon..."),
    Section(title: "Сопоставление документов", caption: "Coming soon...")
]
