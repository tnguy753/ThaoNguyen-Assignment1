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

            VStack (spacing: 8){
                learnMoreButton
                nextButton
            }
            
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
        .padding()
    }
        
}

struct LocationPreview_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreview(album: albums[1])
    }
}

extension LocationPreview{
    
    private var imageSection: some View {
        ZStack {
            if let imageName = album.imageName.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(ColorConstants.main)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
         VStack(alignment: .leading, spacing: 4) {
             Text(album.albumName)
                 .font(.title2)
                 .fontWeight(.bold)
             Text(album.artist)
                 .font(.subheadline)
         }
         .frame(maxWidth: .infinity, alignment: .leading)
      
        
    }
    
    private var learnMoreButton: some View {
        Button{} label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button{} label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}
