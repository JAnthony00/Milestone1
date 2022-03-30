//
//  Milestone1App.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import SwiftUI

@main
struct Milestone1App: App {
    var List = ItemList(Item: Item(Name: "Milk", isChecked: true))
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
