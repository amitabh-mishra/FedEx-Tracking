//
//  PackageInfoDisplay.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/17/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

struct PackageInfoDisplay: View {
    
    var trackingID: String = ""
    //var packageSource: String = ""
    var createdAt: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(trackingID)
                    .font(.headline)
                //Text(packageSource)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct PackageInfoDisplay_Previews: PreviewProvider {
    static var previews: some View {
        PackageInfoDisplay()
    }
}
