//
//  SinglePostView.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/09.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct SinglePostView: View {
    var body: some View {
        List {
            PostCell().listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct SinglePostView_Preview: PreviewProvider {
    static var previews: some View {
        SinglePostView()
    }
}
