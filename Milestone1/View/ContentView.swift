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
        
        Item(name: "To-Do List 1", isChecked: true, id: 0),
        Item(name: "To-Do List 2", isChecked: false, id: 1),
        Item(name: "To-Do List 3", isChecked: false, id: 2),
        Item(name: "To-Do List 4", isChecked: true, id: 3)
        
    ])
    
    var body: some View {
        //lists Items vertically
        List {
            //loops through Items until there are none left
            ForEach (viewModel.items) { Item in
                //writes the name of the item in a horizontal stack
                HStack {
                    //navigation to ListEditView on each item
                    NavigationLink("\(Item.name)", destination: ListEditView())
                    Spacer()
                    
                    
                    //CHECKED ITEM IS NOT NECESSARY HERE
//                    if Item.isChecked {
//                        Image(systemName: "checkmark.square") //places checked square next to the name if isChecked is true.
//                    } else {
//                        Image(systemName: "square") //placed empty square next to the name if isChecked is false.
//                    }
                    
                    
                    
                }
            }
            //delete function - no memory
            .onDelete(perform: deleteItem)
        }
        .navigationTitle("Checklist")
        //need to add a trailing button for adding a checklist.
        .navigationBarItems(leading: EditButton())
        .listStyle(PlainListStyle())
    }
    //delete function
    func deleteItem(indexSet: IndexSet) {
        viewModel.items.remove(atOffsets: indexSet)
    }
}

//added a preview from other SwiftUI files (originally created as plain swift file)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
