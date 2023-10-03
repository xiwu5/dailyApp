//
//  ContentView.swift
//  Daily
//
//  Created by Xi Wu on 10/2/23.
//
import SwiftUI

struct CalendarView: View {
       // Create a property to store the current date
       @State private var currentDate = Date()
       @State private var isImagePickerPresented = false
       @State private var selectedDate: Int?
    
       //@State private var selectedImage: Image?
        @Binding var selectedImage: Image?
       // Define the number of columns in the grid (typically 7 for a week view)
       let numberOfColumns = 7
    
       let cellSize: CGFloat = 50.0 // Adjust this value for the desired cell size
       
       var body: some View {
           VStack {
               Text(getFormattedMonthAndYear())
                    .font(.title)
               
               // Create a grid of dates
               LazyVGrid(columns: Array(repeating: .init(.fixed(cellSize)), count: numberOfColumns)) {
                   ForEach(1..<32, id: \.self) { day in
                       Text("\(day)")
                           .frame(width: cellSize, height: cellSize)// Adjust cell size here
                           .font(.headline)
                           .background(Color.gray) // Background color for the date cell
                           .cornerRadius(cellSize / 2) // Make the cell circular
                           .onTapGesture {
                               // Handle date selection here
                               selectedDate = day
                               selectedImage = nil // reset
                               isImagePickerPresented.toggle()
                               // Display photos for the selected date
                               displayPhotosForDate(day)
                           }
                   }
               }
               .frame(maxWidth:.infinity, maxHeight: .infinity) // Make the grid size adjustable
//               Button("Select Photo") {
//                    isImagePickerPresented.toggle()
//               }
               
           }
           .sheet(isPresented: $isImagePickerPresented) {
               if let selectedDate = selectedDate{
                   ImagePicker(selectedImage: $selectedImage)
               }
           }
//           .background(
//               NavigationLink(
//                   "", // Empty label
//                   destination: ImagePicker(selectedImage: $selectedDate),
//                   isActive: Binding<Bool>(
//                       get: { selectedDate != nil },
//                       set: { if !$0 { selectedDate = nil } }
//                   )
//               )
//               .opacity(0) // Hide the navigation link
//           )
       }
    
    func displayPhotosForDate(_ day: Int) {
        // Implement logic to display photos for the selected date
        // You can navigate to a new view or show a sheet/modal with photos.
    }
    
    // Function to format and return the current month and year
    private func getFormattedMonthAndYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: currentDate)
    }
}

