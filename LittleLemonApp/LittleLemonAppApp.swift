//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 06/08/2024.
//

import SwiftUI
import Firebase


@main
struct LittleLemonAppApp: App {
   // @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
        
    
    var body: some Scene {
        WindowGroup {
            FirstView()
            
            
        }
    }
}
