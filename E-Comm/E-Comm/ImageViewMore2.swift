//
//  ImageViewMore2.swift
//  E-Comm
//
//  Created by Marie S on 2024-09-04.
//

import SwiftUI

struct ImageViewMore2: View {
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
                    
                    Text("Notify ME!")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                   
                }
            }}}}

#Preview {
    ImageViewMore2()
}
