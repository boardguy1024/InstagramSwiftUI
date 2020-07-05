//
//  PostingPage.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/01.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct PostingView: View {
    
    @State var description: String = ""
    @State var isPresented: Bool = false
    @State var image: Image?
    @State var uiImage: UIImage?
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    
                    if self.image != nil {
                        self.image!.resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80, alignment: .center).clipped().cornerRadius(5)
                    }
                    else {
                        Image("ic-photo").resizable().aspectRatio(contentMode: .fill).frame(width: 40, height: 40, alignment: .center).clipped().cornerRadius(5).padding()
                    }
                    
                    Spacer()
                    Button(action: self.choosePhoto, label: { Text("Choose Photo")})
                    Spacer()
                }.padding()
                
                VStack (alignment: .leading) {
                    Text("Description").font(.largeTitle).bold()
                    Text("Type your thoughts").font(.caption).foregroundColor(.gray)
                    MultilineTextView(text: self.$description).cornerRadius(6).frame(height: 100, alignment: .leading)
                    
                }.padding()
                
                Spacer()
                Button(action: self.submit, label: { Text("Submit").foregroundColor(.white).bold()}).frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .center).background(Color.blue).cornerRadius(10).padding()
            }
            
            // ScrollViewに対して.sheetを設定しておく
            // BindしているisPresentedの値がtrueになったら、contentのImagePickerを表示させる
        }.sheet(isPresented: self.$isPresented, content: {
            ImagePicker(isShown: self.$isPresented, image: self.$image)
        })
        
    }
    
    func submit() {
        
    }
    
    func choosePhoto() {
        self.isPresented.toggle()
    }
}

struct PostingView_Preview: PreviewProvider {
    static var previews: some View {
        PostingView()
    }
}
