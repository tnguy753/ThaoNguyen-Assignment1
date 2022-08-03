//
//  CardView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 03/08/2022.
//

import SwiftUI

struct CardView: View {
    
    let album: Album
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottom) {
                Image(album.imageName[1])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .frame(width: screen.bounds.width*0.75, height: screen.bounds.height*0.6)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(album: albums[0])
    }
}
