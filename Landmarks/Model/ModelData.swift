//
//  ModelData.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/22/21.
//

import Foundation
import Combine

//an observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    //because you'll never modify hike data after initial loading it, you don't need to mark it with @Published
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
        grouping: landmarks,
            by: { $0.category.rawValue })
    }
}


//fetches JSON data with given name from app's main bundle
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) form main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
