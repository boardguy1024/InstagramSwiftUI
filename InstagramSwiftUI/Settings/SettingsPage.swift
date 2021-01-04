//
//  SettingsPage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth
import RealmSwift

struct SettingsView: View {
    
    @State var isPresented: Bool = false
    @State var image: Image?
    @State var username: String = ""
    @State var uiImage: UIImage?

    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack {
            HStack {
                if image != nil {
                     self.image!.resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80, alignment: .center).clipped().cornerRadius(40)
                }
                else {
                    Image("ic-photo").resizable().aspectRatio(contentMode: .fill).frame(width: 40, height: 40, alignment: .center).clipped().cornerRadius(5)
                }
                Spacer()
                Button(action: self.choosePhoto, label: { Text("Choose Photo")})
                Spacer()
            }.padding()
            
            TextField("username", text: self.$username, onEditingChanged: { changed in
                
            }, onCommit: {
                self.submitNewUsername()
                }).padding()
            
            Button(action: self.submit, label: { Text("Submit").bold().foregroundColor(Color.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .center).background(Color.blue).cornerRadius(10).padding()})
            Spacer()
            Button(action: self.logout, label: { Text("Logout").bold().foregroundColor(Color.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .center).background(Color.red).cornerRadius(10).padding()})
        }.sheet(isPresented: self.$isPresented, content: {
            ImagePicker(isShown: self.$isPresented, image: self.$image, uiImage: self.$uiImage)
        })
    }
    
    func submit() {
        
    }
    
    func logout() {
        self.isLoggedIn = false
        try! Auth.auth().signOut()
        //削除するとログイン時にクラッシュが発生（Object has been deleted or invalidated.）
//        try! uiRealm.write({            
//             uiRealm.deleteAll()
//        })
    }
    
    func submitNewUsername() {
        
    }
    
    func choosePhoto() {
        self.isPresented.toggle()
    }
}
