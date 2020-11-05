//
//  ListModel.swift
//  TODOList
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import Foundation
import SwiftUI

class ListModel: ObservableObject {
  @Published var lists: [ListObject] {
    didSet {
      UserDefaults.standard.set(try? JSONEncoder().encode(lists), forKey: "LIST")
    }
  }
  
  init() {
    lists = UserDefaults.standard.data(forKey: "LIST").flatMap {
      try? JSONDecoder().decode([ListObject].self, from: $0)
    } ?? []
  }
  
  func add(_ title: String) {
    let entry = ListObject(title: title, tasks: [TaskObject]())
    lists.append(entry)
  }
  
  func updateTitle(of entry: ListObject, to newTitle: String) {
    index(of: entry).map { lists[$0].title = newTitle }
  }
  
  func index(of entry: ListObject) -> Int? {
    return lists.firstIndex(of: entry)
  }
  
  func remove(at index: Int) {
    lists.remove(at: index)
  }
}
