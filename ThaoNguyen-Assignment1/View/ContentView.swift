//
//  ContentView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Button{
                print("Button pressed")
            } label: {
                Text("Red Velvet")
                    .foregroundColor(ColorConstants.main1)
                    .fontWeight(.bold)
                    .font( .custom("AbrilFatface-Regular", size: 40))
            }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
