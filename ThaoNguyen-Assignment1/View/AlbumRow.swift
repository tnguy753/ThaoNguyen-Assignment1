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
//  AlbumRow.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI

struct AlbumRow: View {
    var album: Album
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            // Album Image
            Image(album.imageName[0])
                .resizable()
                .cornerRadius(20)
                .scaledToFit()
                .frame(width:180)
            VStack(alignment: .leading) {
                // Album Name
                Text(album.albumName)
                    .bold()
                // Album Artist
                Text(album.artist)
                    .font(.caption .bold())
            }
            .padding()
            .frame(width: 180, alignment: .leading)
            .cornerRadius(20)
            .foregroundColor(.white)
        }
        .padding()
        .frame(width: 135, height: 180)
        .shadow(radius: 3)
        
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRow(album: albums[7])
        AlbumRow(album: albums[5])
    }
}
