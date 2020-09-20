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
    var body: some View {
        VStack {
            VStack {
                Image("test")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.width * aspectRatio, alignment: .center)
                HStack {
                    Image("test").resizable().frame(width: 50, height: 50, alignment: .center).cornerRadius(25)
                    
                    VStack (alignment: .leading) {
                        Text("Park kyung suk")
                        Text(currnetPost.date?.formatData() ?? "").font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                }.padding()
                Divider().padding(.horizontal)
                Text(self.currnetPost.comment).lineLimit(nil).padding()
            }.background(Color.white).cornerRadius(20).shadow(radius: 10).padding()
        }
    }
}

//struct PostCell_Preview: PreviewProvider {
//    static var previews: some View {
//        PostCell(currnetPost: <#T##Post#>)
//    }
//}
