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
            ForEach (interiorList.interiorItem) { Item in
                Button(action: {
                    interiorList.updateItem(item: Item)
                }, label: {
                    HStack {
                        Text("\(Item.name)")
                        Spacer()
                        Image(systemName: Item.isChecked ? "checkmark.square" : "square")
                    }
                })
            }
            .onDelete(perform: interiorList.deleteInteriorItem)
            .onMove(perform: interiorList.moveItem)
            //if user in edit mode, let them change content
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    TextField("Enter new entry name: ", text: $textFieldText) {
                        interiorList.addInteriorItem(name: "\(textFieldText)")
                        textFieldText = ""
                    }
                }
            }
        }
        .navigationBarTitle("\(titleTextFieldText)")
        .navigationBarItems(trailing: EditButton())
        .padding(5)
    }
}

struct ListEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListEditView()
        }
    }
}
