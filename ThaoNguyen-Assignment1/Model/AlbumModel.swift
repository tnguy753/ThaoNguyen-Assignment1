//
//  AlbumModel.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 29/07/2022.
//

import Foundation
import SwiftUI

struct Album: Identifiable {
    var id = UUID()
    var albumName: String
    var artist: String
    var imageName: [String]
    var description: String
    var genre: String
//    var image: Image{
//        Image(imageName)
//    }
}

