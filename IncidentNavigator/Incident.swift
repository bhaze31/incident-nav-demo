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

class Incident: Codable, ObservableObject {
    var code: String!
    var name: String!
    @Published var desc: String!
    @Published var components: [String]!
    @Published var status: IncidentState = .Investigating
    
    init(code: String, name: String, desc: String, components: [String], status: IncidentState = .Investigating) {
        self.code = code
        self.name = name
        self.desc = desc
        self.components = components
        self.status = status
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        name = try container.decode(String.self, forKey: .name)
        desc = try container.decode(String.self, forKey: .desc)
        components = try container.decode(Array<String>.self, forKey: .components)
        status = try container.decode(IncidentState.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(code, forKey: .code)
        try container.encode(name, forKey: .name)
        try container.encode(desc, forKey: .desc)
        try container.encode(components, forKey: .components)
        try container.encode(status, forKey: .status)
    }
    
    enum CodingKeys: CodingKey {
        case code
        case name
        case desc
        case components
        case status
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
