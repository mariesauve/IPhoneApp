//
//  ImageSliderView.swift
//  E-Comm
//
//  Created by user265215 on 8/28/24.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["fn1","fn2","fn3","fn4","fn5"]
    var body: some View {
        
        ZStack(alignment: .bottomLeading){
            
            ZStack(alignment: .trailing){
                ZStack {
                    Image(slides[currentIndex])
                        .renderingMode(.original)
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: .infinity)
                        .opacity(0.3)
                        .padding(.all, 20.0)
                    
                    Text("Welcome!")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding() 
                }
            }}}}

#Preview {
    ImageSliderView()
}
