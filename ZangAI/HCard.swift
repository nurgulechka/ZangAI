//
//  HCard.swift
//  QuzhatChat
//
//  Created by Nurgul Kozhakhmetova on 05.08.2023.
//

import SwiftUI

struct HCard: View {
    var section: Section
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text(section.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .bold()
                Text(section.caption)
                    .font(.system(size: 10))
                    .foregroundColor(.white)
            }
            
           
        }
        .padding()
        .padding(.leading, 15)
        .frame(maxWidth: .infinity, maxHeight: 110)
//        .background(.teal.opacity(0.5))
        .background(Color(red: 47/255, green: 47/255, blue: 54/255))
    }
}


struct HCard_Previews: PreviewProvider {
    static var previews: some View {
        HCard(section: sections[1])
    }
}
