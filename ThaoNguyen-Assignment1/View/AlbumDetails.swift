//
//  AlbumDetails.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI
import CoreLocation

struct AlbumDetails: View {
    var album: Album

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showSheet = false
    
    var body: some View {
        ScrollView {
            VStack (spacing: 2){
                ImageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                VStack (alignment: .leading, spacing: 2) {
                    TitleSection
                    Divider()
                    DescriptionSection
                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:BackButton(action: {presentationMode.wrappedValue.dismiss()})
                )
            }

        }
            .ignoresSafeArea()
            .background(Image("bg2"))
        
        }
    
    }

extension AlbumDetails {
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
    }
    private var TitleSection: some View{

        HStack {
            VStack (alignment: .leading, spacing: 8){
                Text(album.albumName)
                    .font(.custom("AbrilFatface-Regular", size: 40))
                    .fontWeight(.semibold)
                Text(album.genre)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            Image(album.logo)
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
        
    private var DescriptionSection: some View{
        VStack (alignment: .leading, spacing: 8){
            Text(album.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let url = URL(string: album.link){
                HStack() {
                    VStack(spacing: 3) {
                        Image(systemName: "info.circle")
                            .foregroundColor(ColorConstants.main1)
                        Link("More Info", destination: url)
                        .font(.headline)
                    .tint(ColorConstants.main1)
                    }
                    Spacer()
                    Button () {
                        
                    } label: {
                        Text("Track List")
                            .font(.headline)
                            .foregroundColor(ColorConstants.main1)
                    }
                    .buttonStyle(.bordered)
                    ButtonSection
                }
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }

    private var DismissButton: some View{
        Button(){
            showSheet = false
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
    private var ButtonSection: some View{
        ZStack{
            HStack{
                Button {
                    showSheet = true
                } label: {
                    Text("Buy Now")
                        .font(.headline)
                        .frame(width: 125, height: 35)
                }
            }
            .sheet(isPresented: $showSheet, content: {
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
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}

struct AlbumDetails_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetails(album: albums[4])
    }
}
