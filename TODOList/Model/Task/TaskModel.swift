//
//  TaskModel.swift
//  TODOTask
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import Foundation
import SwiftUI

class TaskModel: ObservableObject {
    var tasks: [TaskObject]
    init(tasks: [TaskObject]) {
        self.tasks = tasks
    }
  
  func add(_ title: String) {
    let entry = TaskObject(title: title)
    tasks.append(entry)
  }
  
  func toggleComplete(_ entry: TaskObject) {
    index(of: entry).map { tasks[$0].completed.toggle() }
  }
  
  func updateTitle(of entry: TaskObject, to newTitle: String) {
    index(of: entry).map { tasks[$0].title = newTitle }
  }
  
  func index(of entry: TaskObject) -> Int? {
    return tasks.firstIndex(of: entry)
  }
  
  func remove(at index: Int) {
    tasks.remove(at: index)
  }
}
