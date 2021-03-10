//
//  Incident.swift
//  IncidentNavigator
//
//  Created by Brian Hasenstab on 3/10/21.
//

import Foundation

enum IncidentState: String, Codable, Equatable, CaseIterable {
    case Investigating
    case Identified
    case Monitoring
    case Resolved
}

class Incident: Codable {
    var code: String!
    var name: String!
    var desc: String!
    var components: [String]!
    var status: IncidentState = .Investigating
    
    init(code: String, name: String, desc: String, components: [String], status: IncidentState = .Investigating) {
        self.code = code
        self.name = name
        self.desc = desc
        self.components = components
        self.status = status
    }
}

extension Incident: Identifiable {
    var id: String { return code }
}

var demoIncidents: [Incident] = [
    Incident(code: "abc123", name: "API Deploy Failure", desc: "Deployment caused an issue to our API become available", components: ["API"], status: .Resolved),
    Incident(code: "def456", name: "Authentication Failing", desc: "Users cannot authenticate or use service", components: ["Auth", "Web"]),
    Incident(code: "ghi789", name: "Intermittent 500", desc: "Traffic congestion has caused intermittent 500s", components: ["Web", "API"], status: .Resolved)
]
