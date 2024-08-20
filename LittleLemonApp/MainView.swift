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
            
            ContactUsView().tabItem {
                Image(systemName: "phone")
                Text("Contact Us")
            }
        }
    }
}



#Preview {
    MainView().environmentObject(DataManager())
}
