//
//  PackageView.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/17/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI
import CoreData
import SQLite3

struct PackageView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PackageInfo.getAllPackageInfo()) var packageInfo:FetchedResults<PackageInfo>
    
    @State private var newPackage = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Enter Tracking Number")) {
                    HStack {
                        TextField("Tracking ID", text: self.$newPackage)
                        
                        Button(action: {
                            let packageInfo = PackageInfo(context: self.managedObjectContext)
                            packageInfo.trackingID = self.newPackage
                            packageInfo.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            }
                            catch {
                                print(error)
                            }
                            
                            self.newPackage = ""
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                
                Section(header: Text("Package Info")) {
                    ForEach(self.packageInfo) { packageInfo in
                        PackageInfoDisplay(trackingID: packageInfo.trackingID!, createdAt: "\(packageInfo.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.packageInfo[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Track a Package"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView()
    }
}
