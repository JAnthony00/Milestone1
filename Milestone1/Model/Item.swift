//
//  Item.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import Foundation

///Parameters & Description
///- Name: A string for the name of the item
///- isChecked: A bool to check whether a box will be ticked next to the item
///- id: An integer number to make each item unique
///
///The item struct holds the information for the objects we'll be listing.
struct Item: Identifiable {
    var Name: String
    var isChecked: Bool
    let id: Int
}
