//
//  HomePage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeView: View {
 
    @ObservedObject var dataHandler: DataHandler
    var body: some View {
        
        NavigationView {
            List {
                ForEach(self.dataHandler.homePagePosts, id: \.id, content: { post in
    
                   PostCell(currnetPost: post).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                })
            }.navigationBarTitle("Home", displayMode: .inline)
        }
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(dataHandler: DataHandler())
//    }
//}
