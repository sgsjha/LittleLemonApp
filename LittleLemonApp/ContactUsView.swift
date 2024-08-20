//
//  ContactUsView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 20/08/2024.
//

import SwiftUI
import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct ContactUsView: View {
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var feedback: String = ""
    @State private var isSubmitted: Bool = false
    
    // Firebase Realtime Database reference
    private var databaseRef: DatabaseReference = Database.database().reference()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Contact Information")) {
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Phone Number", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                    }
                    
                    Section(header: Text("Feedback / Complaints")) {
                        TextField("Enter your feedback or complaints", text: $feedback)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Button(action: {
                        submitFeedback()
                    }) {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .navigationTitle("Contact Us")
                .alert(isPresented: $isSubmitted) {
                    Alert(title: Text("Thank you!"), message: Text("Your feedback has been submitted."), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
        }
    }
    
    // Function to submit feedback to Firebase
    private func submitFeedback() {
        guard let user = Auth.auth().currentUser else {
            print("User not logged in")
            return
        }
        
        let userID = user.uid
        let contactInfo = ["name": name, "phoneNumber": phoneNumber, "feedback": feedback]
        
        // Save contact information under the authenticated user's UID
        databaseRef.child("contact_us").child(userID).setValue(contactInfo) { error, _ in
            if let error = error {
                print("Error saving data: \(error.localizedDescription)")
            } else {
                print("Data saved successfully!")
                isSubmitted = true
                clearForm()
            }
        }
    }
    
    // Function to clear the form after submission
    private func clearForm() {
        name = ""
        phoneNumber = ""
        feedback = ""
    }
}


#Preview {
    ContactUsView()
}
