//
//  AddNewListView.swift
//  TODOList
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI

struct AddNewListView: View {
    @Binding var presentedAsModal: Bool
    @EnvironmentObject var model: ListModel
    @State private var newList: String = ""
    
    var body: some View {
        TextField("New list", text: $newList, onCommit:  {
            //
        })
        Button("Add") {
            self.model.add(self.newList)
            self.presentedAsModal = false
        }
    }
}

