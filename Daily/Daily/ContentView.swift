//
//  ContentView.swift
//  Daily
//
//  Created by Xi Wu on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    //@Binding var selectedImage: Image? // Declare the binding at the parent level
    @State private var selectedImage:Image?
    
    var body: some View {
        VStack {
            CalendarView(selectedImage: $selectedImage) // Pass the binding to CalendarView
            PhotoUploadView(selectedImage: $selectedImage) // Pass the binding to PhotoUploadView
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

