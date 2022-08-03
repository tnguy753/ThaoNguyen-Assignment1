//
//  ContentView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI

let screen = UIScreen.main

struct ContentView: View {

    @Binding var active: Bool
    var body: some View {

            GeometryReader{ proxy in
                ZStack{
                    Ellipse().fill(ColorConstants.main
                    )
                    .rotationEffect(.degrees(90))
                    .offset(y: -screen.bounds.width*0.7)
                    .edgesIgnoringSafeArea(.top)
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .center, spacing: 20) {
                            Text("Music Library")
                                .font(.custom("AbrilFatface-Regular", size: 36))
                            Text("Where you can find the best source of music record")
                                    .font(.custom("AbrilFatface-Regular", size: 17))
                        }
                        .foregroundColor(ColorConstants.main1)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                        VStack(alignment: .center, spacing: 30) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10){
                                    ForEach(albums.prefix(5), id:\.id){ album in
                                        GeometryReader{proxy in
                                            CardView(album: album)
                                                .rotation3DEffect(.degrees(Double(proxy.frame(in: .global).minX - 20) / -20), axis: (x:0, y: 1, z:0))
                                        }
                                        .frame(width:screen.bounds.width*0.75, height: screen.bounds.height*0.6)
                                    }
                                }
                            }
                            .padding(.horizontal, 25)
                            .padding(.vertical)
                            Button (action: {
                                active = false },
                             label: {
                                Text("Get started")
                                    .font(.custom("AbrilFatface-Regular", size: 20))
                                    .foregroundColor(.white)
                                    .padding(.all, 18)
                                    .background(ColorConstants.bg2.opacity(0.8))
                                    .cornerRadius(12)
                                    .shadow(radius: 2)
                               
                            })
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
