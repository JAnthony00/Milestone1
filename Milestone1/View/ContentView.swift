//
//  ContentView.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import SwiftUI

struct ContentView: View {
    //item list containing name, whether it is checked, and unique id.
    var Items = [Item(Name: "Milk", isChecked: true, id: 0),
                 Item(Name: "Bread", isChecked: false, id: 1),
                 Item(Name: "Coffee", isChecked: false, id: 2),
                 Item(Name: "Other Stuff", isChecked: true, id: 3)]
    
    var body: some View {
        //lists Items vertically
        List {
            //loops through Items until there are none left
            ForEach (Items) { Item in
                HStack {
                    //writes the name of the item in a horizontal stack
                    Text(Item.Name)
                        if Item.isChecked == true {
                            Image(systemName: "checkmark.square") //places checked square next to the name if isChecked is true.
                        } else {
                            Image(systemName: "square") //placed empty square next to the name if isChecked is false.
                    }
                }
            }
        }
    }
}
