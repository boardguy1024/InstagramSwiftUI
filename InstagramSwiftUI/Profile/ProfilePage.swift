//
//  ProfilePage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @ObservedObject var dataHandler: DataHandler
    @Binding var isLoggedIn: Bool
    var body: some View {
        
        NavigationView {
            VStack {
                ProfileViewHeader()
//                QGrid(exampleDataList, columns: 3, columnsInLandscape: nil, vSpacing: 0, hSpacing: 0, vPadding: 0, hPadding: 0, isScrollable: true, showScrollIndicators: false) { post in
//                    
//                    NavigationLink(destination: SinglePostView(), label: {
//                          post.image.aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3, alignment: .center).clipped()
//                        }).buttonStyle(PlainButtonStyle())
//                }
            }.navigationBarItems(trailing: NavigationLink(destination: SettingsView(isLoggedIn: self.$isLoggedIn), label: {
                Image("ic-menu").resizable().frame(width: 20, height: 20, alignment: .center).accentColor(.black)
            })).navigationBarTitle("Profile", displayMode: .inline)
        }
        
    }
    func moveToSettings() {
        
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(dataHandler: DataHandler())
//    }
//}
