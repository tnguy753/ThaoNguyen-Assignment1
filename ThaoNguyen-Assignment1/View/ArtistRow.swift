//
//  ArtistRow.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 31/07/2022.
//

import SwiftUI

struct ArtistRow: View {
    var album: Album
    var body: some View {
        ZStack(alignment: .bottom) {
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
        ArtistRow(album: albums[3])
    }
}
