//
//  Item.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import Foundation

//The item struct holds the information for the objects we'll be listing.
struct Item: Identifiable, Codable {
    
    // name of item
    var name: String
    
    // whether the box will be ticked
    var isChecked: Bool
    
    // randomly generated unique id
    let id: String
    
    //initialiser so that I can declare an Item with an id option (this is only to allow updateChecked to create a replica of an item when changing isChecked
    init(id: String = UUID().uuidString, name: String, isChecked: Bool) {
        self.id = id
        self.name = name
        self.isChecked = isChecked
    }
    
    //update function to invert isChecked, returns another Item which is a replica of the original + inversion.
    func updateChecked() -> Item {
        return Item(id: id, name: name, isChecked: !isChecked)
    }
}
