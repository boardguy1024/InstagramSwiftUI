//
//  LoginPage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/06.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import Realm

struct LoginView: View {
    
    @State var email = String()
    @State var password = String()
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .leading, endPoint: .trailing).frame(height: 200, alignment: .top).edgesIgnoringSafeArea(.top).shadow(radius: 10)
                
                Text("Instagram").foregroundColor(.white).bold().font(.largeTitle).padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            }
            
            TextField("Email", text: self.$email).padding()
            SecureField("Password", text: self.$password).padding()
            
            Button(action: self.login) {
                Text("login").bold().foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                }.background(Color.blue).cornerRadius(10).padding()
            
            HStack {
                Text("Don't have an account?")
                Button(action: self.signUp, label: {
                    Text("Sign Up Now.")
                })
            }
            Spacer()
        }.sheet(isPresented: self.$isPresented, content: {
            SignUpView(isPresented: self.$isPresented)
        })
    }
    
    func login() {
        Auth.auth().signIn(withEmail: self.email, password: self.password) { (result, error) in
            if error == nil {
                let user = UserObject()
                user.id = result?.user.uid ?? ""
                user.isLoggedIn.value = true
                user.writeToRealm()
            }
            else {
                print(error)
            }
        }
    }
    func signUp() {
        self.isPresented.toggle()
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
