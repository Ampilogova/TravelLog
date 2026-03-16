//
//  Item.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/16/26.
//

import SwiftData

@Model
class Item {

    var title: String

    init(title: String = "") {
        self.title = title
    }
}
