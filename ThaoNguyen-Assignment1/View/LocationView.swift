/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Nguyen Thi Huong Thao
 ID: s3891825
 Created  date: 28/07/2022
 Last modified: 07/08/2022
 Acknowledgement: Acknowledge the resources that you use here.
 */
//
//  LocationView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 31/07/2022.
//

import SwiftUI
import MapKit

struct LocationView: View {
    // Initialize coordinate
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        // Create Map with Annotation pin
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
