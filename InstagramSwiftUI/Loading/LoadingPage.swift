//
//  LoadingPage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/11/07.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    
    // EnvironmentObjectとは
    // アプリ全体で共有のプロパティとなる（複数のViewから参照できる）
    @EnvironmentObject var dataHandler: DataHandler
    
    @State var isLoggedIn: Bool = false
    @State var isViewLoaded: Bool = false
    var body: some View {
        Group {
            if isViewLoaded {
                
                if isLoggedIn {
                    // HomeView
                    TabViewController(dataHandler: dataHandler)
                } else {
                    LoginView()
                }
                
            } else {
                Text("Instagram").bold().font(.largeTitle)
            }
            
        }.onAppear() {
            self.dataHandler.checkIfLoggedIn { (isLoggedIn) in
                
                //スプラッシューっぽくInstagramテキストを少し見せるため
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isLoggedIn = isLoggedIn
                    self.isViewLoaded = true
                }
                
            }
        }
    }
}
