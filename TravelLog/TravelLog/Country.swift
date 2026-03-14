//
//  Untitled.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/3/26.
//
import Foundation
import SwiftUI
import SwiftData

@Model
class CountryVisit {

    var name: String
    var memory: String
    var rating: Int
    var region: String
    var flagURL: String

    init(name: String, memory: String, rating: Int, region: String, flagURL: String) {
        self.name = name
        self.memory = memory
        self.rating = rating
        self.region = region
        self.flagURL = flagURL
    }
}
