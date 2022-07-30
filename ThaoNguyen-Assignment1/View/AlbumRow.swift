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
            Image(album.imageName)
                .resizable()
                .cornerRadius(20)
                .scaledToFit()
                .frame(width:180)
            VStack(alignment: .leading) {
                Text(album.albumName)
                    .bold()
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
        AlbumRow(album: albums[0])
        AlbumRow(album: albums[0])
    }
}
