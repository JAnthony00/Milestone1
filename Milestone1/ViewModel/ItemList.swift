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
        //tries to decode the data into the datatype [Item] then set the decoded data to the items array.
        guard
            let data = UserDefaults.standard.data(forKey: "item_list"),
            let savedItems = try? JSONDecoder().decode([Item].self, from: data) else {return}
        
        self.items = savedItems
    }
    
    //deletes item at current interacted point
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        saveItems()
    }
    
    //adds an item with the name "checklist" which is unticked
    func addListRow(name: String) {
        let newListRow = Item(name: "Checklist", isChecked: false)
        items.append(newListRow)
        saveItems()
    }
    //can move items
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    //trys to encode into a blob of data since userdefaults cannot work with an array
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "item_list")
        }
    }
}
