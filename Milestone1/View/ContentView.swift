//
//  ContentView.swift
//  Milestone1
//
//  Created by Jack Brighton on 30/3/22.
//

import SwiftUI

struct ContentView: View {
    //item list containing name, whether it is checked, and unique id.
    @EnvironmentObject var itemList: ItemList
    
    var body: some View {
        //lists Items vertically
        List {
            //loops through Items until there are none left
            ForEach (itemList.items) { Item in
                HStack {
                    //navigation to ListEditView on each item
                    NavigationLink("\(Item.name)", destination: ListEditView())
                }
            }
            //delete function
            .onDelete(perform: itemList.deleteItem)
        }
        .navigationTitle("Checklist")
        //need to add a trailing button for adding a checklist.
        .navigationBarItems(
            //default editbutton function
            leading: EditButton(),
            //when pressed, runs plusButtonPressed function which adds a new item with the name "Checklist"
            trailing: Button(action: plusButtonPressed,
                             label: {
                                 Image(systemName: "plus")
                             }))
        .listStyle(PlainListStyle())
    }
    func plusButtonPressed () {
        itemList.addListRow(name: "")
    }
}

//added a preview from other SwiftUI files (originally created as plain swift file)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        .environmentObject(ItemList())
    }
}


