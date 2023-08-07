//
//  CardElement.swift
//  ZangAI
//
//  Created by Nurgul Kozhakhmetova on 06.08.2023.
//

import SwiftUI

struct CardElement: Identifiable {
    var id = UUID()
    var title: String
    var link: String
    var image: Image
}

var cardElements = [
    CardElement(title: "Условия использования", link: "https://zangai.streamlit.app/?option=Terms+%26+Conditions", image: Image(systemName: "doc.plaintext")),
    CardElement(title: "Политика приватности", link: "https://zangai.streamlit.app/?option=Privacy+Policy", image: Image(systemName: "exclamationmark.shield")),
    CardElement(title: "Поддержка", link: "https://zangai.streamlit.app/?option=Contact+%26+Support", image: Image(systemName: "questionmark.circle"))
]
