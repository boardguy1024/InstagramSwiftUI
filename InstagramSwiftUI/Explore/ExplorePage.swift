//
//  ExplorePage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct ExploreView: View {
    @State var searchText = String()
    var body: some View {
        TextField("Search.....", text: self.$searchText)
    }
}

struct ExploreView_Preview: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
