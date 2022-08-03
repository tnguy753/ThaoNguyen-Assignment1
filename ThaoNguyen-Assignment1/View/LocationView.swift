//
//  LocationView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 31/07/2022.
//

import SwiftUI
import MapKit

struct LocationView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: albums, annotationContent: {album in MapMarker(
            coordinate: coordinate, tint: ColorConstants.main1)
            
        })
        
                .onAppear {
                    setRegion(coordinate)
                }
                .ignoresSafeArea()

        }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(coordinate: CLLocationCoordinate2D(latitude: 10.785411159255107, longitude: -106.67859629949592))
    }
}
