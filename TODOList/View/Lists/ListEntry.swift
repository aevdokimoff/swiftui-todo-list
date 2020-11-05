//
//  ListEntry.swift
//  TODOList
//
//  Created by Artem Evdokimov on 05.11.2020.
//

import SwiftUI

struct ListEntry: View {
    var entry: ListObject
    
    @EnvironmentObject var model: ListModel
    @Environment(\.editMode) var editMode
    var bgColor: String;
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text(entry.title)
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color(hex: bgColor))
                        )
                Spacer()
            }
        }
    }
}
