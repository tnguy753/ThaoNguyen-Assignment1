//
//  HomePage.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 30/07/2022.
//

import SwiftUI

struct HomePage: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    var body: some View {
        NavigationView {
                ZStack {
                    Image("bg2")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        artistSection
                        albumSection
                    }
                    .edgesIgnoringSafeArea(.top)

                }
               
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
        
    
}

extension HomePage {
    private var artistSection: some View{
        VStack(alignment: .leading) {
            Text("Artists")
                .font(.custom("AbrilFatface-Regular", size: 40))
                .foregroundColor(ColorConstants.main1)
                .background(Color.white)
                .padding()
        
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(albums, id:\.id){ album in
                        NavigationLink(
                            destination: AlbumDetails(album: album),
                            label: {ArtistRow(album: album)}
                        )
                        .padding(.trailing)
                        
                    }
                    .padding(.leading)
                    
                }
                
            }
            
        }
        
    }
    private var albumSection: some View{
        VStack(alignment: .leading) {
            Text("Albums")
                .font(.custom("AbrilFatface-Regular", size: 40))
                .foregroundColor(ColorConstants.main1)
            .padding()
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: 1)
                    {
                        ForEach(albums, id:\.id){
                            album in NavigationLink(
                                destination: AlbumDetails(album: album),
                                label: {AlbumRow(album: album)}
                            )
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }

}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

