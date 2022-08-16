//
//  Incident.swift
//  motorola
//
//  Created by Bence Fulop on 15/8/2022.
//

import Foundation

struct Incident: Codable, Identifiable {
    
    let title: String
    let callTime: String
    let lastUpdated: String
    let id: String
    let latitude: Double
    let longitude: Double
    let description: String?
    let location: String
    let status: String
    let type: String
    let typeIcon: String

}
