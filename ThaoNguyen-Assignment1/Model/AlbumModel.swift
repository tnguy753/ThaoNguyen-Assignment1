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
    var tracklist: [String]
    var link: String
    var coordinates: CLLocationCoordinate2D
    var locationName: String
    var address: String
}

