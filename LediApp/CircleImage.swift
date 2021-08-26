//
//  CircleImage.swift
//  CircleImage
//
//  Created by Juan Diego Ocampo on 8/26/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
//        Image(systemName: "bed.double.fill")
        Image("bed")
            .font(.system(size: 256, weight: .bold))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}


