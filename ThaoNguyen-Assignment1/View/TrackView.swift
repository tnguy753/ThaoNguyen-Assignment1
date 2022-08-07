//
//  TrackView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 06/08/2022.
//

import SwiftUI

struct TrackView: View {
    var album: Album
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorConstants.main)
            .frame(width: 380, height: 840)
            VStack {
                Image(album.imageName[2])
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 300, height: 300)
                    .padding()
                VStack(spacing: 20) {
                    ForEach(album.tracklist, id: \.self) { tracklist in
                        Text(tracklist)
                        
                    }
                    .font(.custom("AbrilFatface-Regular", size: 24))
                    .foregroundColor(.black)
                    
                }
            }

        }

    }
    
}
    

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(album: albums[6])
    }
}
