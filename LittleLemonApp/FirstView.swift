//
//  FirstView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 06/08/2024.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
               
                
                Image("LittleLemon_Logo").frame(width: 350, height: 100, alignment: .center).padding()
                
                VStack(alignment: .trailing){
                    Text("Login").font(.system(size: 50)).bold()
                }
               
                
                TextField("Email", text: .constant(""))
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8.0)
                    
                
                SecureField("Password", text: .constant(""))
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8.0)
                    .padding(.bottom)
                
                
                HStack{
                    // SIGN UP BUTTON
                    Button(action: {
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
                        // Handle login
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


#Preview {
    FirstView()
}



