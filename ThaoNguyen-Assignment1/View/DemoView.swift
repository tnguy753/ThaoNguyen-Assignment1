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
//  DemoView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 02/08/2022.
//

import SwiftUI

struct DemoView: View {
    
    // Set state to true
    @State var isWelcomeActive: Bool = true
    
    var body: some View {
        ZStack {
            // If button is pressed, navigate to Homepage
            if isWelcomeActive {
                ContentView(active: $isWelcomeActive)
            } else {
                HomePage()
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
