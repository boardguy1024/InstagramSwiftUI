//
//  ProfileViewHeader.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/05.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileViewHeader: View {
    var body: some View {
        HStack {
            VStack {
                Image("test").resizable().frame(width: 80, height: 80, alignment: .center).cornerRadius(40)
                Text("Park kyung suk").font(.footnote)
            }
            Spacer()
            VStack (alignment: .center) {
                Text("Followers").font(.callout).bold()
                Text("1,200").font(.caption).bold()
            }
            Spacer()
            VStack (alignment: .center) {
                Text("Following").font(.callout).bold()
                Text("1,200").font(.caption).bold()
            }
        }.padding()
    }
}

struct ProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewHeader()
    }
}
