//
//  Profile.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/27/21.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "s_my_name_here")
    
    enum Season: String, CaseIterable, Identifiable {
        case Spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { self.rawValue }
        
    }
    
}


