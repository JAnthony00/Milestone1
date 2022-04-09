//
//  Milestone1App.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import SwiftUI

@main
struct Milestone1App: App {
    //declare itemList as a StateObject
    @StateObject var itemList: ItemList = ItemList()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            //every view can now see itemList's information
            .environmentObject(itemList)
        }
    }
}
