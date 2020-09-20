//
//  TabViewController.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/06.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct TabViewController: View {
    
    // EnvironmentObjectとは
    // アプリ全体で共有のプロパティとなる（複数のViewから参照できる）
    @EnvironmentObject var dataHandler: DataHandler
    
    var body: some View {
        TabView {
            HomeView(dataHandler: dataHandler).tabItem { Image(systemName: "house.fill")}
            ExploreView(dataHandler: dataHandler).tabItem { Image(systemName: "bolt.circle.fill")}
            PostingView().tabItem { Image(systemName: "arrowtriangle.up.circle.fill")}
            NotificationView(dataHandler: dataHandler).tabItem { Image(systemName: "tray.fill")}
            ProfileView(dataHandler: dataHandler).tabItem { Image(systemName: "person.circle.fill")}
        }.accentColor(Color.black)
    }
}

//struct TabViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        TabViewController(dataHandler: DataHandler())
//    }
//}
