//
//  AddNewTask.swift
//  TODOTask
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI

struct AddNewTaskView: View {
    @Binding var presentedAsModal: Bool
    var index: Int
    @EnvironmentObject var model: ListModel
    @State private var newTask: String = ""
    
    var body: some View {
        TextField("New task title", text: $newTask, onCommit:  {
            //
        })
        Button("Add") {
            self.model.lists[index].tasks.append(TaskObject(id: UUID(), title: self.newTask, completed: false))
            self.presentedAsModal = false
        }
    }
}

