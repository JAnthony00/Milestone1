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
            ForEach (itemList.items) { item in
                HStack {
                    //navigation to ListEditView on each item
                    NavigationLink("\(item.name)", destination: ListEditView())
                }
            }
            //delete & move function
            .onDelete(perform: itemList.deleteItem)
            .onMove(perform: itemList.moveItem)
        }
        .navigationTitle("Checklist")
        .navigationBarItems(
            leading: EditButton(),
            //when pressed, runs plusButtonPressed function which adds a new item with the name "Checklist"
            trailing: Button(action: plusButtonPressed,
                             label: {
                                 Image(systemName: "plus")
                             }))
        .listStyle(PlainListStyle())
    }
    func plusButtonPressed () {
        itemList.addListRow(name: "Checklist" )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        .environmentObject(ItemList())
    }
}


