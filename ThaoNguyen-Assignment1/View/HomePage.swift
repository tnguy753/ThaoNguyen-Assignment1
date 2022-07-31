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
                    VStack(alignment: .leading) {
                        Text("Artists")
                            .font(.custom("AbrilFatface-Regular", size: 20))
                            .foregroundColor(ColorConstants.main1)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(albums, id:\.id){ album in
                                NavigationLink(
                                    destination: AlbumDetails(album: album),
                                    label: {AlbumRow(album: album)}
                                )
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
                    .navigationBarHidden(true)
                    .navigationBarTitle("Homepage", displayMode: .inline)
            }
                   
        }
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

