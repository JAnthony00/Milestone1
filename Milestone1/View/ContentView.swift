//
//  ContentView.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import SwiftUI

struct ContentView: View {
    var Items = [Item(Name: "Milk", isChecked: true, id: 0),
                 Item(Name: "Bread", isChecked: false, id: 1),
                 Item(Name: "Coffee", isChecked: false, id: 2),
                 Item(Name: "Other Stuff", isChecked: true, id: 3)]
    
    var body: some View {
        List {
            ForEach (Items) { Item in
                HStack {
                    Text(Item.Name)
                        if Item.isChecked == true {
                            Image(systemName: "checkmark.square")
                        } else {
                            Image(systemName: "square")
                    }
                }
            }
        }
    }
}
