//
//  AddTripView.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/3/26.
//

import SwiftUI
import SwiftData

struct AddCountryView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context

    @State private var name = ""
    @State private var memory = ""
    @State private var rating = 3

    let service = CountryService()
    
    var body: some View {

        NavigationStack {

            Form {

                TextField("Country", text: $name)
                TextField("Memory", text: $memory)

                Stepper("Rating: \(rating)", value: $rating, in: 1...5)
            }

            .navigationTitle("Add Country")

            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Button("Done") {

                        Task {

                            do {

                                let info = try await service.fetchCountryInfo(name: name)

                                let country = CountryVisit(
                                    name: name,
                                    memory: memory,
                                    rating: rating,
                                    region: info.region,
                                    flagURL: info.flags.png
                                )

                                context.insert(country)

                                try? context.save()

                                dismiss()

                            } catch {
                                print("API error:", error)
                            }
                        }
                    }
                }
            }
        }
    }
}
