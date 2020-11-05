//
//  TaskObject.swift
//  TODOList
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import Foundation

struct TaskObject: Equatable, Identifiable, Codable {
    var id = UUID()
    var title: String
    var completed: Bool = false
}
