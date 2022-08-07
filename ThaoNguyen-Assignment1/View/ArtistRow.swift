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
//  ArtistRow.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 31/07/2022.
//

import SwiftUI

struct ArtistRow: View {
    // Initialize album array
    var album: Album
    var body: some View {
        ZStack(alignment: .bottom) {
            // Design artist logo image
            Image(album.logo)
                .resizable()
                .cornerRadius(20)
                .scaledToFit()
                .frame(width:180)
        }
        .padding()
        .frame(width: 135, height: 180)
        .shadow(radius: 3)
    }
}

struct ArtistRow_Previews: PreviewProvider {
    static var previews: some View {
        ArtistRow(album: albums[2])
    }
}
