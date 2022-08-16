//
//  DateFormatter+Extensions.swift
//  motorola
//
//  Created by Bence Fulop on 16/8/2022.
//

import Foundation

extension DateFormatter {
    
    static var dateWithTimeZoneFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()

}
