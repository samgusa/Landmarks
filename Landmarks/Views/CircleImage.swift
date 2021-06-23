//
//  CircleImage.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/21/21.
//

import SwiftUI

struct CircleImage: View {
    //common in SwiftUI, custom views will often wrap and encapsulate a series of modifiers for a particular view
    var image: Image
    
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
