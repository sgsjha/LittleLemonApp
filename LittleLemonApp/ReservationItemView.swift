import SwiftUI

struct ReservationItemView: View {
    var reservation: Reservation
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reservation.name)
                    .font(.headline)
                Text(formattedDate(reservation.date))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Time: \(formattedTime(reservation.time))")
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

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    private func formattedTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
}

#Preview {
    ReservationItemView(reservation: Reservation(id: "a", date: Date(), time: Date(), guests: 2, name: "John Doe"))
}

