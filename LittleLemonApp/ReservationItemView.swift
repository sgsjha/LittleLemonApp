//  ReservationItemView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 09/08/2024.
//

import SwiftUI

struct ReservationItemView: View {
    var reservation: Reservation
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reservation.date)
                    .font(.headline)
                Text("Time: \(reservation.time)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Guests: \(reservation.guests)")
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
    ReservationItemView(reservation: Reservation(id: "a", date: "August 15, 2024", time: "7:00 PM", guests: 2))
}

