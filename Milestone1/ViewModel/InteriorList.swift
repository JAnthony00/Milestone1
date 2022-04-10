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
        let defaultInteriorItem = [
            Item(name: "Item", isChecked: false)
        ]
        interiorItem.append(contentsOf: defaultInteriorItem)
    }
    //deletes item at current interacted point
    func deleteInteriorItem(indexSet: IndexSet) {
        interiorItem.remove(atOffsets: indexSet)
    }
    //adds an item with the name "checklist" which is unticked
    func addInteriorItem(name: String) {
        //appending "Item" as the name is a problem which needs to be fixed.
        let newListRow = Item(name: "Placeholder", isChecked: false)
        interiorItem.append(newListRow)
    }
    //identifies the item which is being updated through its index, then runs the update function in Item Model
    func updateItem(item: Item) {
        if let index = interiorItem.firstIndex(where: { $0.id == item.id }) {
            interiorItem[index] = item.update()
        }
    }
}
