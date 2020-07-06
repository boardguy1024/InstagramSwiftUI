//
//  SignUpPage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/06.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var username: String = ""
    @State var password1: String = ""
    @State var password2: String = ""
    
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
        UITableView.appearance().backgroundColor = .white
        UITableView.appearance().separatorColor = .clear
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: self.$email).frame(height: 60, alignment: .center)
                    TextField("Username", text: self.$username).frame(height: 60, alignment: .center)
                    SecureField("Password", text: self.$password1).frame(height: 60, alignment: .center)
                    SecureField("Confirm Password", text: self.$password2).frame(height: 60, alignment: .center)
                    
                }
                
                Section {
                    Button(action: self.submit, label: {
                        Text("Sign up").bold().foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .center).background(Color.blue).cornerRadius(10).padding()
                    })
                }
            }.navigationBarTitle("Sign Up")
        }
    }
    
    func submit() {
        //親ビューで持っているIsPresentedをBindingして
        //子ビューにて値を変更してSheetを閉じさせるため
        self.isPresented.toggle()
    }
}

struct SignUpView_PreView: PreviewProvider {
    static var previews: some View {
        SignUpView(isPresented: .constant(false))
    }
}
