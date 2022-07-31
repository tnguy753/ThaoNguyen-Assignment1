//
//  ContentView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("bg2")
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(destination: HomePage(), label:{
                    Text("Music Corner")
                        .padding()
                        .foregroundColor(.black)
                        .font( .custom("AbrilFatface-Regular", size: 40))
                        .background{
                            Image("bg")
                                .resizable()
                                .frame(width: 200, height:100)
                            
                        }
                        .navigationBarBackButtonHidden(true)
                }
            
                )
            }
            .navigationBarHidden(true)
        }
        
    }
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
