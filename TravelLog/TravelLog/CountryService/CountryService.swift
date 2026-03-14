//
//  File.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/4/26.
//

import Foundation

class CountryService {
    
    func fetchCountryInfo(name: String) async throws -> CountryAPIResponse {
        
        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = URL(string: "https://restcountries.com/v3.1/name/\(encodedName)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let countries = try JSONDecoder().decode([CountryAPIResponse].self, from: data)
        
        guard let first = countries.first else {
            throw URLError(.badServerResponse)
        }
        
        return first
    }
}
