//
//  Mission.swift
//  Moonshot
//
//  Created by newbie on 22.07.2022.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let crew: [CrewMember]
    let launchDate: Date?
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    struct CrewMember: Codable {
        let name: String
        let role: String?
    }
}
