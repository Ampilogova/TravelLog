//
//  CountryAPIResponse.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/14/26.
//

import Foundation

struct CountryAPIResponse: Decodable {
    
    struct Flags: Decodable {
        let png: String
    }
    
    let region: String
    let flags: Flags
}
