//
//  ContentView.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabViewController(dataHandler: DataHandler())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
