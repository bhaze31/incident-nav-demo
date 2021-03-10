//
//  IncidentNavigatorApp.swift
//  IncidentNavigator
//
//  Created by Brian Hasenstab on 3/10/21.
//

import SwiftUI

@main
struct IncidentNavigatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(incident: demoIncidents.first!)
        }
    }
}
