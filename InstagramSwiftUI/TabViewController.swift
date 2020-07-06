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
    var body: some View {
        TabView {
            HomeView().tabItem { Image(systemName: "house.fill")}
            ExploreView().tabItem { Image(systemName: "bolt.circle.fill")}
            PostingView().tabItem { Image(systemName: "arrowtriangle.up.circle.fill")}
            NotificationView().tabItem { Image(systemName: "tray.fill")}
            ProfileView().tabItem { Image(systemName: "person.circle.fill")}
        }.accentColor(Color.black)
    }
}

struct TabViewController_Preview: PreviewProvider {
    static var previews: some View {
        TabViewController()
    }
}
