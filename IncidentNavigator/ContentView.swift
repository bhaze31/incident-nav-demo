//
//  ContentView.swift
//  IncidentNavigator
//
//  Created by Brian Hasenstab on 3/10/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var incident: Incident

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Incident Status")) {
                    Picker("Incident State", selection: $incident.status) {
                        ForEach(IncidentState.allCases, id: \.self) { state in
                            Text(state.rawValue)
                        }
                    }
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $incident.desc)
                }
            }

            Spacer()
        }
        .navigationTitle(incident.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(incident: demoIncidents[1])
        }
    }
}
