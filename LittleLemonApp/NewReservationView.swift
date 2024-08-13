import SwiftUI

struct NewReservationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataManager: DataManager
    
    @State private var reservationDate = Date()
    @State private var reservationTime = Date()
    @State private var guests = 1
    @State private var name = ""

    var body: some View {
        VStack {
            TextField("Enter Name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom, 20)

            HStack {
                VStack(alignment: .leading) {
                    Text("Date")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("", selection: $reservationDate, displayedComponents: [.date])
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                        .frame(width: 150) // Adjust width as needed
                }
                .padding(.trailing)

                VStack(alignment: .leading) {
                    Text("Time")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("", selection: $reservationTime, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                        .frame(width: 150) // Adjust width as needed
                }
            }
            .padding(.bottom, 20)

            Stepper("Number of Guests: \(guests)", value: $guests, in: 1...20)
                .padding(.bottom, 20)

            Button(action: {
                dataManager.addReservation(date: reservationDate, time: reservationTime, guests: guests, name: name)
                
                // print selected date
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                print(formatter.string(from: reservationDate))
                
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

