//
//  ContentView.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    CategoryHome()
                        .tabItem {
                            Label("Featured", systemImage: "star")
                        }
                        .tag(Tab.featured)
                    LandmarkList()
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                        .tag(Tab.list)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    //a preview fails if any subview requires a model object in the environment, but the view you are previewing doesn't have the environment object modifier. 
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
