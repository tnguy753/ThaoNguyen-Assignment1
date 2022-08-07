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
//  ColorConstants.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import Foundation
import SwiftUI

struct ColorConstants{
    
    static let main = Color(red: 173/255, green: 216/255, blue: 230/255)
    static let main2 = Color(red: 224/255, green: 255/255, blue: 255/255)
    static let main1 = Color(red: 46/255, green: 167/255, blue: 189/255)
    static let bg =  LinearGradient(gradient: Gradient(colors: [.white,main1]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let bg2 = RadialGradient(gradient: Gradient(
        colors: [main1, .white, main]),
                                    center: .center,
                                    startRadius: 2,
                                    endRadius: 650)
}


