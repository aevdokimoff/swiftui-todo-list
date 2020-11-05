//
//  ListsOverview.swift
//  TODOList
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI
import UIKit
import QGrid

struct GridCell: View {
  var entry: ListObject
  var model: ListModel
    
  var body: some View {
    VStack() {
        NavigationLink(
            destination: TasksOverview(index: model.lists.firstIndex(of: entry) ?? 0).environmentObject(model)
        ) {
            ListEntry(entry: entry, bgColor: colorPalette.randomElement()!)
        }
    }
  }
}

struct ListsOverview: View {
    @State var presentingModal = false
    
    @EnvironmentObject var model: ListModel
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                QGrid(model.lists, columns: 3) { GridCell(entry: $0, model: model)
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.clear)
                        )
                }
            }
            .navigationBarTitle("Lists")
            .navigationBarItems(trailing:
                Button("Add") { self.presentingModal = true }
                .sheet(isPresented: $presentingModal) { AddNewListView(presentedAsModal: self.$presentingModal).environmentObject(model) })
        }
    }
}


