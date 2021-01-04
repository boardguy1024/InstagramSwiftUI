//
//  ContentView.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        TabViewController(dataHandler: DataHandler(), isLoggedIn: self.$isLoggedIn)
    }
}
