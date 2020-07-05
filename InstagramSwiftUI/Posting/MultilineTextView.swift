//
//  MultilineTextView.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/02.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
