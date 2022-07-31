//
//  AlbumList.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI

struct AlbumList: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    
    var body: some View {

        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: 10)
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
        
            
         
struct AlbumList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumList()
    }
}
