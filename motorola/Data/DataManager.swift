//
//  DataManager.swift
//  motorola
//
//  Created by Bence Fulop on 15/8/2022.
//

import Foundation

class DataManager {
    private var stubEndpoint = "https://run.mocky.io/v3/5e90b420-388e-4913-b240-b5326823212c"
    
    var incidents = [Incident]()
    
    init() {
        
        if let url = URL(string: stubEndpoint) {
            if let data = try? Data(contentsOf: url) {
                let jsondecoder = JSONDecoder()
                do {
                    let stubIncidents = try jsondecoder.decode(Incident.self, from: data)
//                    for incident in stubIncidents {
//                        let newIncident = Incident(
//                        Incident(
//                            title: incident.title
//                            callTime: String
//                            lastUpdated: String
//                            id: String
//                            latitude: Int
//                            longitude: Int
//                            description: String
//                            location: String
//                            status: String
//                            type: String
//                            typeIcon: String
//                        )
//                        self.incidents.append(newIncident)
                    }
                catch {
                    print("error trying parse json: \(error)")
                }
                }
            }
        }
    }


