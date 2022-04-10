//
//  ItemList.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import Foundation
class ItemList: ObservableObject {
    //creating an array of items
    //@published allows for each view to be updated when this array changes (for add/delete function)
    @Published var items: [Item] = []
    
    //initialising the item array
    init() {
        //makes contents of the items array the default below
        addItems()
    }

    func addItems() {
        let defaultListRow = [
            //default information to initialise the array
            Item(name: "Checklist", isChecked: false)
        ]
        //appends newItems array to
        items.append(contentsOf: defaultListRow)
    }
    
    //deletes item at current interacted point
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    //adds an item with the name "checklist" which is unticked
    func addListRow(name: String) {
        let newListRow = Item(name: "Checklist", isChecked: false)
        items.append(newListRow)

    }
}
