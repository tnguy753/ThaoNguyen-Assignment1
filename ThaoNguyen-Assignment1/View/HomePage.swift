//
//  HomePage.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 30/07/2022.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
                ZStack {
                    Image("bg2")
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("My Top 10")
                            .font(.custom("AbrilFatface-Regular", size: 20))
                        
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
        }
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
}
