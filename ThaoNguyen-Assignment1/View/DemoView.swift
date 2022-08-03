//
//  DemoView.swift
//  ThaoNguyen-Assignment1
//
//  Created by Nguyễn Thảo on 02/08/2022.
//

import SwiftUI

struct DemoView: View {
    @State var isWelcomeActive: Bool = true

    var body: some View {
            ZStack {
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
