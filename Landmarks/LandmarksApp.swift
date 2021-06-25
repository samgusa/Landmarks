//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/20/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    //create a model instance and supply it to contentview using environment object modifier
    //use the @StateObject attribute to initialize a model object for a given property only once during the life time of app. This is true when you use the attribute in an app instance, as well as when you use it in a view.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
