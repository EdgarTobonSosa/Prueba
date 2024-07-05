//
//  SliderView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

struct SliderView: View {
    let employeeName: String
    @Binding var showSlider: Bool
    var body: some View {


        VStack {
            HStack {
                VStack(alignment: .leading){
                    Image(systemName: "person")
                        .frame(width: 40,height: 40)
                        .background{
                            Circle()
                                .stroke(lineWidth: 1)
                            
                        }
                    
                    
                    Text(employeeName)
                        .foregroundStyle(Color.white)
                        .bold()
                        .padding(.top, 30)
                }
                Spacer()
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .onTapGesture {
                        self.showSlider.toggle()
                    }
                
            }
            .padding()
            .background{
                Color.blue
        }
            HStack {
                PhotosPickerView(nameImage: "")
                Spacer()
            }
            .padding(.leading, 16)
            Spacer()
            Color.white
            
        }
        

    }
}

#Preview {
    SliderView(employeeName: "Edgar Tobon Sosa", showSlider: Binding.constant(true))
}
