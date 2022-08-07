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
//  LocationPreview.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 02/08/2022.
//

import SwiftUI

struct LocationPreview: View {
    // Initialize album array
    var album: Album
    var body: some View {
        HStack (alignment: .center, spacing: 0) {
            // Connect Store Image + Store Name in vertical stack
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            // Connect Store Address in horizontal stack
            addressSection
        }
        .padding(15)
        // Background Shape Design
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(ColorConstants.main1)
                .offset(y: 40)
        )
        .cornerRadius(10)
        
        .padding()
    }
    
}

struct LocationPreview_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreview(album: albums[2])
        LocationPreview(album: albums[4])
    }
}

extension LocationPreview{
    // Design Store Image
    private var imageSection: some View {
        ZStack {
            if let imageName = album.imageName[3] {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(ColorConstants.main1)
        .shadow(color: .white, radius: 10)
        .cornerRadius(10)
    }
    // Design Store Name
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(album.locationName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(ColorConstants.main2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
    // Design Store Address
    private var addressSection: some View {
        VStack(alignment: .center, spacing: 2) {
            Image(systemName: "map.fill")
                .font(.title2)
                .foregroundColor(ColorConstants.main2)
                .background(ColorConstants.main1)
            Text(album.address)
                .font(.headline)
                .foregroundColor(ColorConstants.main2)
        }
        
        
    }
    
    
}
