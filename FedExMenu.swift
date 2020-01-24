//
//  FedExMenu.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/11/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI
import CoreData

struct FedExMenu: View {
    var body: some View {
        VStack {
            TabView
            {
                Centers()
                    .tabItem {
                        Text("Centers")
                        Image(systemName: "house")
                    }.tag(0)
                    
                Tracking()
                    .tabItem {
                        Text("Create")
                        Image(systemName: "pencil")
                    }.tag(1)
                
                PackageView()
                    .tabItem {
                        Text("Track")
                        Image(systemName: "cube.box" )
                }.tag(2)
            }
        }
    }
}

struct FedExMenu_Previews: PreviewProvider {
    static var previews: some View {
        FedExMenu()
    }
}
