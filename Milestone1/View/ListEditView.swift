//
//  ListEditView.swift
//  Milestone1
//
//  Created by Jack Brighton on 6/4/22.
//

import SwiftUI

struct ListEditView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                //adding text field to type in
                TextField("Enter new entry name... ", text: $textFieldText)
                //make it look nice
                    .padding(.horizontal)
                    .frame(height: 40)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            //making a save button
            Button(action: {
                //blank at the moment
            }, label: {
                Text("Save".uppercased())
                //make it look nice
                    .frame(height: 40)
                    .font(.headline)
            })
            .navigationTitle("Checklist 📝")
            .padding(5)
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
