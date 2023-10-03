import SwiftUI


struct PhotoUploadView: View {
    @Binding var selectedImage: Image? // Declare the binding
    @State private var isImagePickerPresented = false
    @State private var capturedUIImage: UIImage? // Add a state property for the captured image

    var body: some View {
        VStack {
            Button("Select Photo") {
                isImagePickerPresented.toggle()
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }

            ImageCaptureView(image: selectedImage ?? Image(systemName: "photo"), frameSize: CGSize(width: 200, height: 200), capturedUIImage: $capturedUIImage)
                .aspectRatio(contentMode: .fit)

            // Add a button to save the selected image
            Button("Save Photo") {
                // Access the captured UIImage
                guard let uiImage = capturedUIImage else { return }

                // Handle saving the UIImage here
                // ...
            }
        }
    }
}

