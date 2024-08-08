//
//  MainView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 08/08/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Menu")
                }
            
            ReservationsView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Reservations")
                }
        }
    }
}

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

struct ReservationsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Reservations")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ReservationItemView(date: "August 15, 2024", time: "7:00 PM", guests: 2)
                        ReservationItemView(date: "August 20, 2024", time: "8:30 PM", guests: 4)
                        ReservationItemView(date: "August 25, 2024", time: "6:00 PM", guests: 3)
                    }
                    .padding(.horizontal, 20).padding(.vertical, 20)
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal, 10)
            }
            .background(Color(.systemGray6))
            //.navigationTitle("Reservations")
        }
    }
}

struct ReservationItemView: View {
    var date: String
    var time: String
    var guests: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(date)
                    .font(.headline)
                Text("Time: \(time)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Guests: \(guests)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}


#Preview {
    MainView()
}
