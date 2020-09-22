//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/05.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct NotificationCell: View {
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                NavigationLink(destination: SinglePostView(currnetPost: Post()), label: {
                    Image("test").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50, alignment: .center).cornerRadius(5)
                    VStack (alignment: .leading) {
                        Text("Park like your post").font(.callout)
                        Text("One hour ago").font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                }).buttonStyle(PlainButtonStyle())
                
            }.padding()
        }.background(Color.white).cornerRadius(10).shadow(radius: 8).padding()
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
