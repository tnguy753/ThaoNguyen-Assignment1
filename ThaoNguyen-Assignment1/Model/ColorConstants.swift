//
//  ColorConstants.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 28/07/2022.
//

import Foundation
import SwiftUI

struct ColorConstants{
  
    static let main = Color(red: 173/255, green: 68/255, blue: 171/255)
    static let main1 = Color(red: 54/255, green: 52/255, blue: 163/255)
    static let bg =  LinearGradient(gradient: Gradient(colors: [.white,main1]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let bg2 = RadialGradient(gradient: Gradient(
        colors: [main, .white]),
        center: .center,
        startRadius: 2,
        endRadius: 650)
       }


