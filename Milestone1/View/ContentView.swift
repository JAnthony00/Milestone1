//
//  ContentView.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import SwiftUI

struct ContentView: View {
    //item list containing name, whether it is checked, and unique id.
    var viewModel = ItemList(items: [
        
        Item(name: "Milk", isChecked: true, id: 0),
        Item(name: "Bread", isChecked: false, id: 1),
        Item(name: "Coffee", isChecked: false, id: 2),
        Item(name: "Other Stuff", isChecked: true, id: 3)
        
    ])
    
    var body: some View {
        //lists Items vertically
        List {
            //loops through Items until there are none left
            ForEach (viewModel.items) { Item in
                HStack {
                    //writes the name of the item in a horizontal stack
                    Text(Item.name)
                    Spacer()
                    if Item.isChecked {
                        Image(systemName: "checkmark.square") //places checked square next to the name if isChecked is true.
                    } else {
                        Image(systemName: "square") //placed empty square next to the name if isChecked is false.
                    }
                }
            }
        }
    }
}
