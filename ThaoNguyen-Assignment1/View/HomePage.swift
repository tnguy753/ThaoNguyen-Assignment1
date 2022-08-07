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
//  HomePage.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 30/07/2022.
//

import SwiftUI

struct HomePage: View {
    // Initialize columns to display in grid style
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    
    var body: some View {
        NavigationView {
            ZStack{
                // Added background image
                Image("bg2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        header
                        artistSection
                        albumSection
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
        
        .navigationBarBackButtonHidden(true)
    }
    
    
}

extension HomePage {
    // Header Section
    private var header: some View{
        VStack(){
            HStack{
                // Sidebar Menu Icon
                Image(systemName: "line.horizontal.3.decrease")
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                // App Logo
                Text("Music")
                    .font(.system(.headline, design: .rounded))
                Text("Library")
                    .fontWeight(.ultraLight)
            }
            
            HStack{
                HStack{
                    // Searching Section
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(UIColor.systemIndigo))
                        .padding()
                    Text("Search Artists, Albums etc...")
                        .font(.footnote)
                        .padding()
                    Spacer()
                    Divider().frame(height: 24)
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .padding()
                }
                .foregroundColor(Color.secondary.opacity(0.5))
                .background(Color.gray.opacity(0.1))
                .cornerRadius(80)
                .shadow(radius: 1)
                .padding()
                
            }
            
            
        }
    }
    // Artist Section
    private var artistSection: some View{
        VStack(alignment: .leading) {
            // SubHeader 1
            Text("Artists")
                .font(.custom("AbrilFatface-Regular", size: 35))
                .foregroundColor(ColorConstants.main1)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    // Loop through Artist Row View
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
    // Album Section
    private var albumSection: some View{
        VStack(alignment: .leading) {
            // SubHeader 2
            Text("Albums")
                .font(.custom("AbrilFatface-Regular", size: 35))
                .foregroundColor(ColorConstants.main1)
                .padding()
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: 1)
                    {
                        // Loop through Album Row View
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

