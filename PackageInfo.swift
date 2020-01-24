//
//  PackageInfo.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/17/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import Foundation
import CoreData

public class PackageTrackingInfo {
    public var createdAt: Date?
    public var trackingID: String?
    public var packageSource: String?
    public var packageDestination: String?
    public var packageWeight: Int64?
}


public class PackageInfo: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var trackingID: String?
    @NSManaged public var packageSource: String?
    @NSManaged public var packageDestination: String?
    @NSManaged public var packageWeight: Int64
}

extension PackageInfo {
    static func getAllPackageInfo() -> NSFetchRequest<PackageInfo> {
        let request: NSFetchRequest<PackageInfo> = PackageInfo.fetchRequest() as!
            NSFetchRequest<PackageInfo>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
