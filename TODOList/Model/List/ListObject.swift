//
//  ListObject.swift
//  TODOList
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import Foundation

struct ListObject: Equatable, Identifiable, Codable {
    var id = UUID()
    var title: String
    var tasks: [TaskObject]
}
