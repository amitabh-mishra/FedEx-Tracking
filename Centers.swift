//
//  Centers.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/11/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import SwiftUI
import MapKit

struct Center: Identifiable {
    let id: Int
    let name: String
    var latitude: Double
    var longitude: Double
}


struct Centers: View {
    
    var centersList = [
        Center(id: 0, name: "Northborough, MA", latitude: 42.418167, longitude: -71.643903),
        Center(id: 1, name: "Edison, NJ", latitude: 40.518292, longitude: -74.408250),
        Center(id: 2, name: "Pittsburgh, PA", latitude: 40.441153, longitude: -80.001085),
        Center(id: 3, name: "Martinsburg, WV", latitude: 39.455403, longitude: -77.969607),
        Center(id: 4, name: "Charlotte, NC", latitude: 35.230542, longitude: -80.830114),
        Center(id: 5, name: "Atlanta, GA", latitude: 33.750391, longitude: -84.389734),
        Center(id: 6, name: "Orlando, FL", latitude: 28.536559, longitude: -81.373485),
        Center(id: 7, name: "Memphis, TN", latitude: 35.151671, longitude: -90.053080),
        Center(id: 8, name: "Grove City, OH", latitude: 39.882248, longitude: -83.088256),
        Center(id: 9, name: "Indianapolis, IN", latitude: 39.762249, longitude: -86.143806),
        Center(id: 10, name: "Detroit, MI", latitude: 42.332617, longitude: -83.051228),
        Center(id: 11, name: "New Berlin, WI", latitude: 42.975810, longitude: -88.104085),
        Center(id: 12, name: "Minneapolis, MN", latitude: 44.978915, longitude: -93.265246),
        Center(id: 13, name: "St. Louis, MO", latitude: 38.625942, longitude: -90.198525),
        Center(id: 14, name: "Kansas, KS", latitude: 39.099712, longitude: -94.593319),
        Center(id: 15, name: "Dallas, TX", latitude: 32.770530, longitude: -96.790730),
        Center(id: 16, name: "Houston, TX", latitude: 29.752662, longitude: -95.360442),
        Center(id: 17, name: "Denver, CO", latitude: 39.733311, longitude: -105.000761),
        Center(id: 18, name: "Salt Lake City, UT", latitude: 40.761350, longitude: -111.912307),
        Center(id: 19, name: "Phoenix, AZ", latitude: 33.449065, longitude: -112.069320),
        Center(id: 20, name: "Los Angeles, CA", latitude: 34.047851, longitude: -118.254962),
        Center(id: 21, name: "Chino, CA", latitude: 34.011150, longitude: -117.689353),
        Center(id: 22, name: "Sacremento, CA", latitude: 38.580749, longitude: -121.489583),
        Center(id: 23, name: "Seattle, WA", latitude: 47.604506, longitude: -122.326981),
    ]
    
    var body: some View {
        NavigationView
        {
            List(centersList){ Center in
                NavigationLink(destination: CenterMap(center: Center.self))
                {
                    Text(Center.name)
                }
            }.navigationBarTitle(Text("Centers"))
        }
    }
}

struct Centers_Previews: PreviewProvider {
    static var previews: some View {
        Centers()
    }
}
