//
//  Create.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/14/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI
import CoreData

struct Create: View {
    
    @State var trackingID = ""
    @State private var trackPackage = false
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                   Section {
                        Text("Enter Tracking Number")
                        TextField("Tracking Number", text: $trackingID)
                   }
                    
                    Button(action: {self.trackPackage.toggle()}) {
                        Text("Track Package")
                    }
                    
                }.navigationBarTitle(Text("Track a Package"))
            }
        }
    }
}


struct Create_Previews: PreviewProvider {
    static var previews: some View {
        Create()
    }
}
