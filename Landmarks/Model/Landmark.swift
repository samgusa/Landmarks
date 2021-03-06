//
//  Landmark.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/22/21.
//

import Foundation
import SwiftUI
import CoreLocation

//codable makes it easier to load data into the structure from data file.
//landmark already has id property required by Identifiable protocol; you only need to add a property to decode it when reading the data
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    //you make the property private b/c we only care about the image itself.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates: Coordinates
    
    //useful for interacting with the MapKit framework
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    
}
