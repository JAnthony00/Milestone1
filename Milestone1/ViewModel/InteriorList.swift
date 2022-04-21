//
//  InteriorList.swift
//  Milestone1
//
//  Created by Jack Brighton on 10/4/22.
//

import Foundation
//copy of ItemList
class InteriorList: ObservableObject {
    @Published var interiorItem: [Item] = []
    
    //init interiorItem
    init() {
        addinteriorItem()
    }
    
    func addinteriorItem() {
        guard
            let interiorData = UserDefaults.standard.data(forKey: "interior_list"),
            let savedInteriorItems = try? JSONDecoder().decode([Item].self, from: interiorData) else {return}
        
        self.interiorItem = savedInteriorItems
    }
    //deletes item at current interacted point
    func deleteInteriorItem(indexSet: IndexSet) {
        interiorItem.remove(atOffsets: indexSet)
        saveItems()
    }
    //adds an item with the name "checklist" which is unticked
    func addInteriorItem(name: String) {
        let newListRow = Item(name: name, isChecked: false)
        interiorItem.append(newListRow)
        saveItems()
    }
    //identifies the item which is being updated through its index, then runs the update function in Item Model
    func updateItem(item: Item) {
        if let index = interiorItem.firstIndex(where: { $0.id == item.id }) {
            interiorItem[index] = item.update()
            saveItems()
        }
    }
    //moves items
    func moveItem(from: IndexSet, to: Int) {
        interiorItem.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    //encodes interior items and saves it to a key so that it can be decoded on startup w/user default
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(interiorItem) {
            UserDefaults.standard.set(encodedData, forKey: "interior_list")
        }
    }
}
