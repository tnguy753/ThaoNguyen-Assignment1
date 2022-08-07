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
//  AlbumDetails.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI
import CoreLocation

struct AlbumDetails: View {
    // Initialize album array
    var album: Album
    // Initialize presentationMode
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // Set state to false
    @State private var showSheetTrack = false
    @State private var showSheetLocation = false
    
    var body: some View {
        ScrollView {
            VStack (spacing: 2){
                ImageSection // List of Album Images (Tab Style)
                VStack (alignment: .leading, spacing: 2) {
                    TitleSection // Album Name + genre
                    Divider()
                    DescriptionSection //Album Description
                }
                // Make navigation bar back button visible
                .navigationBarBackButtonHidden(true)
                // Customize back button
                .navigationBarItems(leading:BackButton(action: {presentationMode.wrappedValue.dismiss()})
                )
            }
            
        }
        .ignoresSafeArea()
        .background(Image("bg2"))
        
    }
    
}

extension AlbumDetails {
    // Album Image Section
    private var ImageSection: some View{
        TabView{
            ForEach(album.imageName.prefix(3), id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
            
        }
        .frame(height: 450)
        .tabViewStyle(PageTabViewStyle())
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
    // Album Title Section
    private var TitleSection: some View{
        HStack {
            VStack (alignment: .leading, spacing: 8){
                Text(album.albumName) //Album Name
                    .font(.custom("AbrilFatface-Regular", size: 40))
                    .fontWeight(.semibold)
                Text(album.genre) //Album Genre
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            Image(album.logo) //Album Logo
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .padding(2)
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    // Album Description Section
    private var DescriptionSection: some View{
        VStack (alignment: .leading, spacing: 8){
            Text(album.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            HStack() {
                LinkSection // More Info
                Spacer()
                TrackListSection // Tracklist Button
                ButtonSection // Buy Now Button
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    //Dismiss Button
    private var DismissButton: some View{
        Button(){
            showSheetLocation = false
            showSheetTrack = false
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
    
    private var LinkSection: some View{
        VStack(spacing: 3) {
            Image(systemName: "info.circle")
                .foregroundColor(ColorConstants.main1)
            Link("More Info", destination: URL(string: album.link)!)
                .font(.headline)
                .tint(ColorConstants.main1)
        }
    }
    private var TrackListSection: some View{
        ZStack{
            HStack{
                Button {
                    showSheetTrack = true
                } label: {
                    Text("Tracklist")
                        .font(.headline)
                        .foregroundColor(ColorConstants.main1)
                }
                .buttonStyle(.bordered)
            }
            .sheet(isPresented: $showSheetTrack, content: {
                TrackView(album: album)
                    .overlay(DismissButton, alignment:
                            .topLeading)
            })
            
        }
        
    }
    
    
    private var ButtonSection: some View{
        ZStack{
            HStack{
                Button {
                    showSheetLocation = true
                } label: {
                    Text("Buy Now")
                        .font(.headline)
                        .frame(width: 125, height: 35)
                }
            }
            .sheet(isPresented: $showSheetLocation, content: {
                ZStack {
                    LocationView(coordinate: album.coordinates)
                        .overlay(DismissButton, alignment:
                                .topLeading)
                    VStack {
                        Spacer()
                        LocationPreview(album: album)
                            .shadow(color: .black.opacity(0.3), radius: 20)
                    }
                    
                }
            })
            .buttonStyle(GradientButtonStyle())
            .padding()
            
        }
        
    }
}

struct BackButton:  View {
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .font(.headline)
                .padding(.all, 6)
                .background(.thinMaterial)
                .cornerRadius(10)
                .foregroundColor(.primary)
                .shadow(radius: 4)
            
        })
        
    }
}
struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [ColorConstants.main1, ColorConstants.main]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(50)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}

struct AlbumDetails_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetails(album: albums[6])
    }
}
