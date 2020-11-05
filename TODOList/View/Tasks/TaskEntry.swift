//
//  TaskEntry.swift
//  TODOTask
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI

struct TaskEntry: View {
    @State var entry: TaskObject
    @EnvironmentObject var model: ListModel
    var indexL: Int
    var indexT: Int
    
    var body: some View {
        HStack {
            Image(systemName: entry.completed ? "checkmark.circle.fill" : "circle")
                .imageScale(.large)
                .foregroundColor(entry.completed ? Color.blue : Color.primary)
                .onTapGesture {
                    entry.completed = true
                    model.lists[indexL].tasks[indexT] = entry;
                }
            TextField("", text: $entry.title)
            Spacer()
        }
    }
}
