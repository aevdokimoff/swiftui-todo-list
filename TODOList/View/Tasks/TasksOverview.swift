//
//  SwiftUIView.swift
//  TasksOverview
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI
import UIKit

struct TasksOverview: View {
    
    @State var presentingModal = false
    var index: Int
    @EnvironmentObject var model: ListModel
    
    var body: some View {
        List {
            Section(header: Text("Open tasks")) {
                ForEach(model.lists[index].tasks.filter{ !$0.completed }) { entry in
                    NavigationLink(
                        destination: TaskDescriptionView(entry: entry)
                    ) {
                        TaskEntry(entry: entry, indexL: index, indexT: model.lists[index].tasks.firstIndex(of: entry) ?? 0).environmentObject(model)
                    }
                }
                .onDelete { (indices) in
                    self.model.remove(at: indices.first!)
                }
            }
            Section(header: Text("Closed tasks")) {
                ForEach(model.lists[index].tasks.filter{ $0.completed }) { entry in
                    NavigationLink(
                        destination: TaskDescriptionView(entry: entry)
                    ) {
                        TaskEntry(entry: entry, indexL: index, indexT: model.lists[index].tasks.firstIndex(of: entry) ?? 0).environmentObject(model)
                    }
                }
                .onDelete { (indices) in
                    self.model.remove(at: indices.first!)
                }
            }
            
            
        }
        .navigationBarTitle("Tasks")
        .navigationBarItems(trailing:
            Button("Add") { self.presentingModal = true }
                                .sheet(isPresented: $presentingModal) { AddNewTaskView(presentedAsModal: self.$presentingModal, index: index).environmentObject(self.model) })
    }
}


