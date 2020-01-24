//
//  CenterMap.swift
//  FedEx
//
//  Created by Amitabh Mishra on 10/11/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//


import SwiftUI
import MapKit

struct CenterMap: UIViewRepresentable {
    let center:Center
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: center.latitude, longitude: center.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct CenterMap_Previews: PreviewProvider {
    static var previews: some View {
        CenterMap(center: Center(id: 23, name: "Seattle, WA", latitude: 47.604506, longitude: -122.326981))
    }
}
