//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/22/21.
//

import SwiftUI

//State is a value, or a set of values, that can change over time, and that affects a view's behavior, content, or layout. You use a property with the @State attribute to add state to a view.

struct LandmarkList: View {
    //the modelData property gets its value automatically, as long as the environment object modifier has been applied to a parent.
    @EnvironmentObject var modelData: ModelData
    
    //because you use state properties to hold info that's specific to a view and its subviews, you always create state as private.
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        //to combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the forEach type instead of passing your collection of data to List.
        NavigationView {
            List {
                //use the $ prefix to access a binding to a state variable, or one of its properties
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
//        ForEach(["iPod touch (7th generation)", "iPhone XS Max", "iPhone 12 Pro Max"], id: \.self) { deviceName in
//                LandmarkList()
//                    .previewDevice(PreviewDevice(rawValue: deviceName))
//                    .previewDisplayName(deviceName)
//        }
    }
}


//Section 4


