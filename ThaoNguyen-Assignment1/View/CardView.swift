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
//  CardView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 03/08/2022.
//

import SwiftUI

struct CardView: View {
    // Initialize album array
    var album: Album
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Image(album.imageName[1])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .frame(width: screen.bounds.width*0.75, height: screen.bounds.height*0.6)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(album: albums[0])
    }
}
