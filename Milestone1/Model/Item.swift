//
//  Item.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import Foundation

//The item struct holds the information for the objects we'll be listing.
struct Item: Identifiable {
    
    // name of item
    var name: String
    
    // whether the box will be ticked
    var isChecked: Bool
    
    // randomly generated unique id
    let id = UUID()

}
