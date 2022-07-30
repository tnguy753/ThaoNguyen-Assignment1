//
//  AlbumDetails.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI

struct AlbumDetails: View {
    var album: Album
    
    var body: some View {
            ZStack {
                VStack{
                    Image(album.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .edgesIgnoringSafeArea(.top)
                    VStack {
                        Text(album.artist)
                            .foregroundColor(ColorConstants.main1)
                            .font(.title)
                            .fontWeight(.bold)
                            .font(.custom("AbrilFatface-Regular",size: 10 ))
                    }
                        
                }
                        
                }
            }
        }
           
struct AlbumDetails_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetails(album: albums[0])
        AlbumDetails(album: albums[1])
        AlbumDetails(album: albums[2])
    }
}
