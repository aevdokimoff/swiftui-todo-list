//
//  TaskDescription.swift
//  TODOTask
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI

struct TaskDescriptionView: View {
    var entry: TaskObject
    
    @State private var isPresentingAlert = false
    
    var body: some View {
        ScrollView {
            Text(entry.title)
            Text(entry.completed ? "Completed" : "Not completed")
        }.navigationBarTitle("Task")
    }
}
