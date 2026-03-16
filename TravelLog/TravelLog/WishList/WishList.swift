//
//  WishList.swift
//  TravelLog
//
//  Created by Tatiana Ampilogova on 3/16/26.
//

import Foundation
import SwiftUI
import SwiftData

struct WishList: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [Item]

       var body: some View {

           NavigationStack {

               List {

                   ForEach(items) { item in
                       TextField(
                           "Wish list",
                           text: Binding(
                               get: { item.title },
                               set: { item.title = $0 }
                           )
                       )
                   }

                   Button {
                       addCountry()
                   } label: {
                       Label("Add country", systemImage: "plus")
                   }

               }
               .navigationTitle("Wish List")
               
           }
       }

       func addCountry() {
           let newItem = Item()
           context.insert(newItem)
           do {
               try context.save()
           } catch {
               print("save failed", error)
           }
       }
   }
