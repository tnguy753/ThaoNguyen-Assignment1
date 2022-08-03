//
//  LocationPreview.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 02/08/2022.
//

import SwiftUI

struct LocationPreview: View {
    var album: Album
    var body: some View {
        HStack (alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            addressSection
        }
        .padding(15)
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
        LocationPreview(album: albums[0])
        LocationPreview(album: albums[1])
    }
}

extension LocationPreview{
    
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
    
    private var titleSection: some View {
         VStack(alignment: .leading, spacing: 4) {
             Text(album.locationName)
                 .font(.title2)
                 .fontWeight(.bold)
                 .foregroundColor(ColorConstants.main2)
         }
         .frame(maxWidth: .infinity, alignment: .leading)
      
        
    }
    
    private var addressSection: some View {
        VStack(alignment: .center, spacing:3) {
            Image(systemName: "map.fill")
                .font(.title3)
                .foregroundColor(ColorConstants.main2)
                .background(ColorConstants.main1)
            Text(album.address)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(ColorConstants.main2)
        }
        

    }
    

}
