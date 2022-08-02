//
//  LocationView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 31/07/2022.
//

import SwiftUI
import CoreLocation
import MapKit

struct LocationView: View {
    var coordinate: CLLocationCoordinate2D

    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .onAppear {
                    setRegion(coordinate)
                }
                .ignoresSafeArea()
            Spacer()
//            LocationPreview(album: album)
//                .shadow(color: .black.opacity(0.3), radius: 20)
//                .padding()
        }
        
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    }

    }

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(coordinate: CLLocationCoordinate2D(latitude: 10.785411159255107, longitude: -106.67859629949592))
    }
}
