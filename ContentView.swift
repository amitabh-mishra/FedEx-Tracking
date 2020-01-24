//
//  ContentView.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/11/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
        VStack
        {
            Text("FedEx Package Tracking")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
                .padding(.top, 20)
            
            TextField("Username" , text: $username)
                .padding()
                .cornerRadius(5.0)
            
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
            
                NavigationLink(destination: FedExMenu()) {
                    Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 80, height: 50)
                    .background(Color.blue)
                    .cornerRadius(30.0)
                        
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
