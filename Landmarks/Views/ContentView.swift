//
//  ContentView.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    //a preview fails if any subview requires a model object in the environment, but the view you are previewing doesn't have the environment object modifier. 
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
