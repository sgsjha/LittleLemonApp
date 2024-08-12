
//  ReservationsView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 09/08/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct ReservationsView: View {
    //@State private var reservations: [Reservation] = []
    @EnvironmentObject var dataManager: DataManager
    @State private var showNewReservationForm = false
    
    var body: some View {
        NavigationView {
          
            VStack{
                
                ScrollView{
                    
                    VStack{
                        ForEach(dataManager.reservations) {
                            reservation in ReservationItemView(reservation: reservation)
                        }
                    }.padding()
                }.padding()
                
                Button(action: {
                                   showNewReservationForm.toggle()
                               }) {
                                   Text("Add New Reservation")
                                       .foregroundColor(.white)
                                       .padding()
                                       .background(Color.blue)
                                       .cornerRadius(8.0)
                               }
                               .padding(.top, 10)
                               .sheet(isPresented: $showNewReservationForm) {
                                   NewReservationView()
                               }
            }
            
           
        }
    }
    
   // Fetch reservations
}

struct Reservation: Identifiable {
    
    var id: String
    var date: String
    var time: String
    var guests: Int
    
}

#Preview {
    ReservationsView().environmentObject(DataManager())
}
