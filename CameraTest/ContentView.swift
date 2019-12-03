//
//  ContentView.swift
//  CameraTest
//
//  Created by Student on 12/2/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct CaptureImageView {
    @Binding var isShown: Bool
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}


struct ContentView: View {
    
    @State var image: UIImage? = nil
    @State var showCaptureImageView: Bool = false
    
    var body: some View {
        ZStack{
            if (showCaptureImageView) {
                ZStack{
                            CaptureImageView(isShown: $showCaptureImageView, image: $image)
                }
            }
            VStack {
                Button(
                    action: {
                        self.showCaptureImageView.toggle()
                    })
                    {
                        Text("Choose photos")
                }
                ForEach(self.image?.getPixels()[100] ?? [], id: \.self) { color in
                    Text(" the value is \(color)")
                }
               
            }
            
        

}
}
}
