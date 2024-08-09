//
//  MenuView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 09/08/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                Color(.white).opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack(alignment: .leading) {
                    
                   
                    VStack(alignment: .center){
                        Image("LittleLemon_Logo").padding(.leading, 50).padding(.vertical)
                        
                        Text("Our Menu")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding([.leading, .bottom], 20)
                            
                            .foregroundColor(.yellow)
                    }
                        
                    
                    // MENU ITEMS
                    ScrollView {
                        VStack(spacing: 20) {
                            MenuItemView(imageName: "pizza", title: "Pizza", description: "Delicious wood-fired pizza with fresh toppings.")
                            MenuItemView(imageName: "pasta", title: "Pasta", description: "Homemade pasta with rich, creamy sauces.")
                            MenuItemView(imageName: "salad", title: "Salad", description: "Fresh and crisp salads with a variety of dressings.")
                            MenuItemView(imageName: "dessert", title: "Dessert", description: "Sweet and delectable desserts to finish your meal.")
                        }
                        .padding(.horizontal, 20).padding(.vertical, 20)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MenuView()
}
