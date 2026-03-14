//
//  TravelLogApp.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/3/26.
//

import SwiftUI
import SwiftData

@main
struct TravelLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: CountryVisit.self)
    }
}
