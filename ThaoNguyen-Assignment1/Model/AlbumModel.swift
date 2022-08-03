//
//  AlbumModel.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 29/07/2022.
//

import Foundation
import SwiftUI
import MapKit

struct Album: Identifiable {
    var id = UUID()
    var albumName: String
    var artist: String
    var logo: String
    var imageName: [String]
    var description: String
    var genre: String
    var link: String
    var coordinates: CLLocationCoordinate2D
    var locationName: String
    var address: String
//    var image: Image{
//        Image(imageName)
//    }
}

