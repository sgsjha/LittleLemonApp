import SwiftUI

struct NewReservationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataManager: DataManager
    
    @State private var date = ""
    @State private var time = ""
    @State private var guests = 1
    
    var body: some View {
        VStack {
            TextField("Date", text: $date)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom, 20)

            TextField("Time", text: $time)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom, 20)

            Stepper("Number of Guests: \(guests)", value: $guests, in: 1...20)
                .padding(.bottom, 20)

            Button(action: {
                dataManager.addReservation(date: date, time: time, guests: guests)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save Reservation")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    NewReservationView()
}

