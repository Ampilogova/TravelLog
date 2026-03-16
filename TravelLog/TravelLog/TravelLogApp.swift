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
            TabView {
                Tab("Trips", systemImage: "airplane.up.right") {
                    ContentView()
                }
                Tab("Wish list", systemImage: "heart") {
                    WishList()
                }
            }
        }
        .modelContainer(for: [CountryVisit.self, Item.self])
    }
}
