//
//  FirstView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 06/08/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct FirstView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isSignedIn = false
    
    var body: some View {
        
        if isSignedIn {
            MainView()
        }
        else {
            NavigationView {
                VStack {
                   
                    
                    Image("LittleLemon_Logo").frame(width: 350, height: 100, alignment: .center).padding()
                    
                    VStack(alignment: .trailing){
                        Text("Login").font(.system(size: 50)).bold()
                    }
                   
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8.0)
                        
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8.0)
                        .padding(.bottom)
                    
                    
                    HStack{
                        // SIGN UP BUTTON
                        Button(action: {
                            signIn()
                            // Handle signup
                        }) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .frame(width: 60, height: 20)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                        
                        
                        // LOGIN BUTTON
                        Button(action: {
                            logIn()
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .frame(width: 60, height: 20)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(15)
                                
                        }
                    }.padding(.all)
                        
                    
                    
                    
                    Button(action: {
                        // Handle Google Sign-In
                    }) {
                        HStack {
                            Image("google_logo").resizable().scaledToFit()
                            Text("Sign in with Google").foregroundStyle(Color.black).font(.title2)
                        }
                        .padding()
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(15)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    NavigationLink(destination: MainView()) {
                        Text("Continue as Guest")
                            .foregroundColor(.blue)
                    }
                    .padding(.bottom, 20)
                }
                .padding()
            }
        }
       
    }
    
    // SIGN UP FUNCTION
    func signIn() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            else{
                isSignedIn = true
            }
        }
    }
    
    // LOG IN FUNCTION
    func logIn() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            else{
                print("log in success")
                isSignedIn = true
            }
        }
    }
    
   
      
}



#Preview {
    FirstView()
}



