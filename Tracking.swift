//
//  Tracking.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/11/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

struct Tracking: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PackageInfo.getAllPackageInfo()) var packageInfo:FetchedResults<PackageInfo>
    
    @State var sourceSel = 2
    @State var destinationSel = 4
    @State var packageWeight = 0
    @State var showDetails = false
    @State var createNew = false
    
     @State var trackingID = Int.random(in: 1..<1000000000)
    
    var sources = ["Northborough, MA", "Edison, NJ", "Pittsburgh, PA", "Martinsburg, WV", "Charlotte, NC", "Atlanta, GA", "Orlando, FL", "Memphis, TN", "Grove City, OH", "Indianapolis, IN", "Detroit, MI", "New Berlin, WI", "Minneapolis, MN", "St. Louis, MO", "Kansas, KS", "Dallas, TX", "Houston, TX", "Denver, CO", "Salt Lake City, UT", "Phoenix, AZ", "Los Angeles, CA", "Chino, CA", "Sacremento, CA", "Seattle, WA"]
    

    var body: some View {
        VStack{
            NavigationView {
                Form {
                   Section {
                        Picker(selection: $sourceSel, label: Text("Package Source")) {
                            ForEach(0 ..< sources.count) {
                                Text(self.sources[$0]).tag($0)
                            }
                        }
                    
                        Picker(selection: $destinationSel, label: Text("Package Destination")) {
                            ForEach(0 ..< sources.count) {
                                Text(self.sources[$0]).tag($0)
                            }
                        }
                    
                        Stepper("Package Weight", onIncrement: {
                            self.packageWeight += 1
                        }, onDecrement: {
                            self.packageWeight -= 1
                        })
                    
                        Text("Weight: \(packageWeight) lbs")
                    }
                    
                    
                    Button(action: {
                        self.showDetails.toggle()
                        let package = PackageTrackingInfo()
                        self.trackingID = Int.random(in: 1..<1000000000)
                        package.createdAt = Date()
                        package.trackingID = String(self.trackingID)
                        package.packageSource = self.sources[self.sourceSel]
                        package.packageDestination = self.sources[self.destinationSel]
                        package.packageWeight = Int64(self.packageWeight)
                        AppDelegate.trackingData[package.trackingID!] = package
                    }) {
                        Text("Create Package")
                    }
                        
                    if showDetails {
                        Text("Tracking ID: " + String(trackingID))
                        Text("Source: \(sources[sourceSel])")
                        Text("Destination: \(sources[destinationSel])")
                        Text("Weight: \(packageWeight) lbs")
                    }
                    
                }
                .navigationBarTitle(Text("Create a Package"))
            }
        }
    }
}

struct Tracking_Previews: PreviewProvider {
    static var previews: some View {
        Tracking()
    }
}
