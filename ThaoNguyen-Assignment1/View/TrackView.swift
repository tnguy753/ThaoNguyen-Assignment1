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
            // Blue Rounded Rectangle Background
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorConstants.main)
                .frame(width: 380, height: 840)
            VStack {
                // Circle Album Image
                Image(album.imageName[2])
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 300, height: 300)
                    .padding()
                // List of album's tracklist
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
