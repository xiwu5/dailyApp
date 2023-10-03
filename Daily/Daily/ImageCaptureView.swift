//
//  ImageCaptureView.swift
//  Daily
//
//  Created by Xi Wu on 10/2/23.
//

import SwiftUI
import UIKit

struct ImageCaptureView: UIViewRepresentable {
    let image: Image
    let frameSize: CGSize
    @Binding var capturedUIImage: UIImage? // Add a binding property

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        if let uiImage = uiImageFromImage(image) {
            uiView.image = uiImage
            capturedUIImage = uiImage // Assign the captured image to the binding property
            uiView.frame.size = frameSize
        }
    }

    private func uiImageFromImage(_ image: Image) -> UIImage? {
        // Create a hosting controller to display the SwiftUI Image
        let hostingController = UIHostingController(rootView: image)
        hostingController.view.bounds = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        // Render the SwiftUI view into an image
        UIGraphicsBeginImageContextWithOptions(hostingController.view.bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            hostingController.view.layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        return nil
    }
}
