//
//  MenuItemView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 08/08/2024.
//

import SwiftUI

import SwiftUI

struct MenuItemView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}


#Preview {
    MenuItemView(imageName: "imageName", title: "itemName", description: "description")
}
