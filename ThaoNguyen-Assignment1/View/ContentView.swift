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
//  ContentView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI

let screen = UIScreen.main

struct ContentView: View {
    // Set active to bool
    @Binding var active: Bool
    var body: some View {
        GeometryReader{ proxy in
            ZStack{
                // Ellipse Shape on top as background
                Ellipse().fill(ColorConstants.main
                )
                .rotationEffect(.degrees(90))
                .offset(y: -screen.bounds.width*0.7)
                .edgesIgnoringSafeArea(.top)
                VStack(alignment: .center, spacing: 24) {
                    VStack(alignment: .center, spacing: 20) {
                        Text("Music Station")
                            .font(.custom("AbrilFatface-Regular", size: 36))
                        Text("Where you can find the best music records")
                            .font(.custom("AbrilFatface-Regular", size: 17))
                    }
                    .foregroundColor(ColorConstants.main1)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
                    VStack(alignment: .center, spacing: 30) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10){
                                //Loop through pictures from album array
                                ForEach(albums.prefix(5), id:\.id){ album in
                                    GeometryReader{proxy in
                                        CardView(album: album)
                                        // Special Effect as scrolling
                                            .rotation3DEffect(.degrees(Double(proxy.frame(in: .global).minX - 20) / -20), axis: (x:0, y: 1, z:0))
                                    }
                                    .frame(width:screen.bounds.width*0.75, height: screen.bounds.height*0.6)
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical)
                        Button (action: {
                            // If button pressed, active sets to "false"
                            active = false },
                                label: {
                            Text("Get started")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(width: 350)
                        })
                        .buttonStyle(GradientButtonStyle())
                    }
                    
                }
                .background(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(active: .constant(true))
    }
}
