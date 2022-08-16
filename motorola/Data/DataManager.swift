//
//  DataManager.swift
//  motorola
//
//  Created by Bence Fulop on 15/8/2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    var incidents = [Incident]()
    
    private init() {}
    
    private var stubEndpoint = "https://run.mocky.io/v3/5e90b420-388e-4913-b240-b5326823212c"
    
    func getSortedIncidents() {
        
        if let url = URL(string: stubEndpoint) {
            if let data = try? Data(contentsOf: url) {
                let jsondecoder = JSONDecoder()
                do {
                    let stubIncidents = try jsondecoder.decode([Incident].self, from: data)
                    for incident in stubIncidents {
                        let newIncident = Incident(
                            title: incident.title,
                            callTime: incident.callTime,
                            lastUpdated: incident.lastUpdated,
                            id: incident.id,
                            latitude: incident.latitude,
                            longitude: incident.longitude,
                            description: incident.description,
                            location: incident.location,
                            status: incident.status,
                            type: incident.type,
                            typeIcon: incident.typeIcon
                        )
                        self.incidents.append(newIncident)
                    }
                    self.incidents = self.sortIncidentsByLastUpdated()
                }
                catch {
                    print("error trying parse json: \(error)")
                }
            }
        }
    }
    
    
    private func sortIncidentsByLastUpdated() -> [Incident] {
        return self.incidents.sorted { (first: Incident, second: Incident) -> Bool in
            let dateFormatter = DateFormatter.dateWithTimeZoneFormat
            let firstDate = dateFormatter.date(from: first.lastUpdated)
            let secondDate = dateFormatter.date(from: second.lastUpdated)
            return firstDate?.compare(secondDate!) == .orderedDescending
        }
    }
}
