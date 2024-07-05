//
//  ImageSelectorView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI


import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    @State var imageSelected = UIImage(systemName: "gear")!
    @State var photoPickerItem: PhotosPickerItem?
    @State var nameImage: String
    @State var errorImage: Bool = false
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                PhotosPicker(selection: $photoPickerItem, matching: .images) {
                    
                    Image(uiImage: imageSelected)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 42)
                        .cornerRadius(10)
                    
                    Text("Setting")
                        .bold()
                    
                }
            }
        }
        .onChange(of: photoPickerItem) { _ in
            Task {
                if let photoPickerItem, let data  = try? await photoPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        imageSelected = image
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosPickerView(photoPickerItem: nil, nameImage: "")
}
