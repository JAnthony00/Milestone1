//
//  ItemList.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import Foundation
class ItemList: ObservableObject {
    //creating an array of items
    @Published var items: [Item] = []
    
    //initialising the item array
    init() {
        addItems()
    }

    func addItems() {
        //tries to decode the data into the datatype [Item] then set the decoded data to the items array. If it cannot, it returns nothing.
        guard
            let data = UserDefaults.standard.data(forKey: "item_list"),
            let savedItems = try? JSONDecoder().decode([Item].self, from: data) else {return}
        //items array is now savedItems
        self.items = savedItems
    }
    
    //deletes item at current interacted point
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        saveItems()
    }
    //adds an item with the name "checklist" which is unticked
    func addListRow(name: String) {
        let newListRow = Item(name: name, isChecked: false)
        items.append(newListRow)
        saveItems()
    }
    //can move items from current interacted point to another point
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    //encodes the items array so that it can be saved as a User Default
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "item_list")
        }
    }
}
