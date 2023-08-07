//
//  Card.swift
//  ZangAI
//
//  Created by Nurgul Kozhakhmetova on 05.08.2023.
//

import SwiftUI

struct Card: View {
    var cardElement: CardElement
    var body: some View {
        HStack(spacing:10){
            ZStack{
                
                cardElement.image
                    .frame(maxWidth: 10, alignment:.leading)
                    .foregroundColor(.teal)
                    .padding()
            }
            Link(cardElement.title, destination: URL(string: cardElement.link)!)
                .foregroundColor(.white)
            Spacer()
                
            }
            .frame(maxWidth: 350, maxHeight: 50)
            .background(Color(red: 47/255, green: 47/255, blue: 54/255))
            .foregroundColor(Color(red: 29/255, green: 29/255, blue: 31/255))
            
            .mask(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        }
//    var body: some View {
//        VStack(alignment: .leading, spacing:10){
//
//                Label{
//                    Link(cardElement.title, destination: URL(string: cardElement.link)!)
//
//                }icon:{
//                    cardElement.image
//
//                        .frame(maxWidth:17, alignment:.leading)
//                        .foregroundColor(.teal)
//                }
//
//
//
//            }
//            .frame(maxWidth: 350, maxHeight: 50)
//            .background(.green)
//            .foregroundColor(Color(red: 29/255, green: 29/255, blue: 31/255))
//
//            .mask(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
//        }
    }


struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(cardElement: cardElements[1])
    }
}
