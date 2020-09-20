//
//  PublicExtenstions.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/09/20.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import RealmSwift

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) {
        self.init()
        self.formatOptions = formatOptions
        self.timeZone = timeZone
    }
}

extension Formatter {
    static let iso8601 = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
}

extension Date {
    var iso8601: String { return Formatter.iso8601.string(from: self) }
    
    func formatData() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}

extension String {
    var iso8601: Date? { return Formatter.iso8601.date(from: self) }
}

extension Object {
    func writeToRealm() {
        try! uiRealm.write({
            uiRealm.add(self, update: .all)
        })
    }
    
    func updateToRealm() {
        try! uiRealm.write({
            uiRealm.add(self, update: .modified)
        })
    }
}


