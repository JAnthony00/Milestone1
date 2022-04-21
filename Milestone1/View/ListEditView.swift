//
//  ListEditView.swift
//  Milestone1
//
//  Created by Jack Brighton on 6/4/22.
//

import SwiftUI

struct ListEditView: View {
    
    //edit mode environment
    @Environment(\.editMode) var editMode
    @State var textFieldText: String = ""
    @State var titleTextFieldText: String = "📝 Checklist"
    @EnvironmentObject var interiorList: InteriorList
    
    var body: some View {
    
        List {
            //loops through items
            ForEach (interiorList.interiorItem) { Item in
                //every item is a button which toggles the isChecked variable when pressed
                Button(action: {
                    interiorList.updateItemChecked(item: Item)
                }, label: {
                    //horizontal stack for item name & checksigns
                    HStack {
                        Text("\(Item.name)")
                        Spacer()
                        Image(systemName: Item.isChecked ? "checkmark.square" : "square")
                    }
                })
            }
            //move & delete functions
            .onDelete(perform: interiorList.deleteInteriorItem)
            .onMove(perform: interiorList.moveItem)
            
            //if user in edit mode, let them change content
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    //text written is taken and added as an item in the interiorList
                    TextField("Enter new entry name: ", text: $textFieldText) {
                        interiorList.addInteriorItem(name: "\(textFieldText)")
                        //reset textfieldtext to be blank
                        textFieldText = ""
                    }
                }
            }
        }
        .navigationBarTitle("\(titleTextFieldText)")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Reset") {
                    //non functional
                }
                EditButton()
            }
        }
    }
}

struct ListEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListEditView()
        }
    }
}
