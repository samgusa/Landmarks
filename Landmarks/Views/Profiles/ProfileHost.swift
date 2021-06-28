//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Sam Greenhill on 6/27/21.
//

import SwiftUI

struct ProfileHost: View {
    //swiftui provides storage in environment for values you can access using the @environment property wrapper. Access edit mode value to read or write the edit scope.
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
            
            
            
            //ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
