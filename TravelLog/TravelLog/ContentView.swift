//
//  ContentView.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/3/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Query var countries: [CountryVisit]
    @Environment(\.modelContext) private var context

    @State private var showAddScreen = false

    var body: some View {

        NavigationStack {

            List {
                ForEach(countries) { country in

                    HStack {
                        Text(flagEmoji(for: country.name.prefix(2).uppercased()))
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(country.name)
                            Text(country.region)
                            Text("Rating: \(country.rating)/5")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let country = countries[index]
                        context.delete(country)
                    }

                    do {
                        try context.save()
                    } catch {
                        print("Delete failed:", error)
                    }
                }
            }
            

            .navigationTitle("TravelLog")

            .toolbar {
                Button {
                    showAddScreen = true
                } label: {
                    Image(systemName: "plus")
                }
            }

            .sheet(isPresented: $showAddScreen) {
                AddCountryView()
            }
        }
    }
    func flagEmoji(for countryCode: String) -> String {
        countryCode
            .uppercased()
            .unicodeScalars
            .map { 127397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
}
