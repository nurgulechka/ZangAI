//
//  VCard.swift
//  QuzhatChat
//
//  Created by Nurgul Kozhakhmetova on 05.08.2023.
//

import SwiftUI

struct VCard: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text("ZangAI")
                    .frame(maxWidth: 170, alignment: .leading)
                    .font(.system(size: 20))
                    .bold()
                Text("Я готова помочь Вам с вопросами, связанными с законодательством Казахстана. ")
                    .font(.system(size: 15))
                
            }
            .foregroundColor(.white)
        Image("LawyerIcon")
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(maxWidth: 65 ,maxHeight: 65, alignment: .topTrailing)

        }
        .padding(20)
        .background(.teal)
//        .background(.linearGradient(colors: [.teal, .teal.opacity(0.4)], startPoint: .topLeading
//                                    , endPoint: .bottomTrailing))
        .foregroundColor(Color(red: 29/255, green: 29/255, blue: 31/255))
        .mask(RoundedRectangle(cornerRadius: 30.0, style: .circular).fill(.teal))
//        .shadow(color: .teal.opacity(0.3), radius: 8.0, x:0, y: 12)
//        .shadow(color: .teal.opacity(0.3), radius: 2.0, x:0, y: 1)
//        .overlay(
//            Image("LawyerIcon")
//                .resizable()
////                .aspectRatio(contentMode: .fill)
//                .clipShape(Circle())
//                .frame(maxWidth: 80 ,maxHeight: 80, alignment: .topTrailing)
//                .padding(.leading, 230)
//                .padding(.bottom, 110)
//            )
    }
}

struct VCard_Previews: PreviewProvider {
    static var previews: some View {
        VCard()
    }
}
