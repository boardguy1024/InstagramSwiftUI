//
//  PostCell.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct PostCell: View {
    var aspectRatio: CGFloat = 1.4998724
    var currnetPost: Post
    @Environment(\.imageCache) var cache: ImageCache
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: self.currnetPost.imageUrl)!, cache: self.cache, placeholder: Color.init(red: 0.9, green: 0.9, blue: 0.9), configuration: {$0.resizable()}).frame(height: (UIScreen.main.bounds.width - 20) * CGFloat(currnetPost.aspectRatio), alignment: .center)
                HStack {
                    Image("test").resizable().frame(width: 50, height: 50, alignment: .center).cornerRadius(25)
                    
                    VStack (alignment: .leading) {
                        Text("Park kyung suk")
                        Text(currnetPost.date?.formatData() ?? "").font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                }.padding()
                Divider().padding(.horizontal)
                Text(self.currnetPost.comment).lineLimit(nil).padding().frame(maxWidth: .infinity, alignment: .leading)
            }.background(Color.white).cornerRadius(20).shadow(radius: 10).padding()
        }
    }
}

//struct PostCell_Preview: PreviewProvider {
//    static var previews: some View {
//        PostCell(currnetPost: <#T##Post#>)
//    }
//}
