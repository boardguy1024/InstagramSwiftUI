//
//  NotificationPage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var dataHandler: DataHandler
    
    init(dataHandler: DataHandler) {
        //ListのSeparatorColorを設定
        UITableView.appearance().separatorColor = .clear
        self.dataHandler = dataHandler
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 20, content: { i in
                    NotificationCell().listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                })
            }.navigationBarTitle("Notifictaions", displayMode: .inline)
        }
    }
}

//struct NotificationView_PreViews: PreviewProvider {
//    static var previews: some View {
//        NotificationView(dataHandler: DataHandler())
//    }
//}
