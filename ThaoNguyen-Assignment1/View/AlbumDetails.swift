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
        ScrollView {
            VStack{
                ImageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                VStack (alignment: .leading, spacing: 16) {
                    TitleSection
                    Divider()
                    DescriptionSection
                    Divider()
                }
                
                }
               
        }
            .ignoresSafeArea()
        
        }
    
    }

extension AlbumDetails {
    private var ImageSection: some View{
        TabView{
            ForEach(album.imageName, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                }
                
            }
            .frame(height: 450)
            .tabViewStyle(PageTabViewStyle())
    }
    private var TitleSection: some View{
        VStack (alignment: .leading, spacing: 8){
            Text(album.artist)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(album.genre)
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    private var DescriptionSection: some View{
        VStack (alignment: .leading, spacing: 8){
            Text(album.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Link("Read more on Wikipedia", destination: URL(string: "https://soundcloud.com/search?q=erik%20st319")!)
                .font(.headline)
                .tint(.blue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


struct AlbumDetails_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetails(album: albums[0])
    }
}
