//
//  ExplorePage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

var exampleDataList = [PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable(),PostIdentifiable()]

struct ExploreView: View {
    
    @State var isSearching: Bool = false
    @State var searchText = String()
    @ObservedObject var dataHandler: DataHandler
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("Search.....", text: self.$searchText, onEditingChanged: { changed in
                    
                }) {
                    self.search()
                }.padding()
                
                if isSearching {
                    
                    List {
                        
                        ForEach(self.dataHandler.homePagePosts, id: \.id) { post in
                            PostCell(currnetPost: post).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                    
                } else {
                    QGrid(exampleDataList, columns: 3, columnsInLandscape: nil, vSpacing: 0, hSpacing: 0, vPadding: 0, hPadding: 0, isScrollable: true, showScrollIndicators: false) { post in
                        
                        NavigationLink(destination: SinglePostView(), label:  {
                            post.image.aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3, alignment: .center).clipped()
                        }).buttonStyle(PlainButtonStyle())
                        
    
                        
                    }
                }
                
            }.navigationBarTitle("Explore", displayMode: .inline)
        }
    }
    
    private func search() {
        if self.searchText == "" {
            self.isSearching = false
        } else {
            self.isSearching = true
        }
    }
}

struct PostIdentifiable: Identifiable {
    var id = UUID()
    
    var image = Image("test").resizable()
}

//struct ExploreView_Preview: PreviewProvider {
//    static var previews: some View {
//        ExploreView(dataHandler: DataHandler())
//    }
//}
