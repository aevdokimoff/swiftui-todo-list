//
//  TODOListApp.swift
//  TODOList
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI

@main
struct TODOListApp: App {
    var body: some Scene {
        WindowGroup {
            ListsOverview().environmentObject(ListModel())
        }
    }
}
