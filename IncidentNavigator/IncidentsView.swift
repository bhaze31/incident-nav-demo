//
//  IncidentsView.swift
//  IncidentNavigator
//
//  Created by Brian Hasenstab on 3/10/21.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var incidents: [Incident] = demoIncidents
}

struct IncidentRow: View {
    @ObservedObject var incident: Incident

    var body: some View {
        NavigationLink(destination: ContentView(incident: incident)) {
            VStack(alignment: .leading) {
                Text(incident.name)
                    .font(.headline)
                Text(incident.status.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct IncidentsView: View {
    @StateObject var state = AppState()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(state.incidents) { incident in
                        IncidentRow(incident: incident)
                    }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("Incidents")
        }
    }
}

struct IncidentsView_Previews: PreviewProvider {
    static var previews: some View {
        IncidentsView()
    }
}
