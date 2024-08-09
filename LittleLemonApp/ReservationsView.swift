//
//  ReservationsView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 09/08/2024.
//

import SwiftUI

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
    ReservationsView()
}
