//
//  ImagePicker.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/07/02.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI


class ImagePickerCordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    init(isShown : Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image   = image
    }
    
    //Selected Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
    }
    
    //Image selection got cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCordinator {
        return ImagePickerCordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
}
