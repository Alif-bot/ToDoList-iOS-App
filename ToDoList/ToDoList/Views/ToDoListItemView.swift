//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let items: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(items.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: items.dueDate).formatted(date:.abbreviated,time:.shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(5)
            Spacer()
            
            Button(action: {viewModel.toggleIsDone(item: items)} ,
                   label: {Image(systemName: items.isCompleted ? "checkmark.circle.fill" : "circle")})
            .foregroundColor(.green)
                .padding(5)
        }
        
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(items: .init(id: "123", title: "Go there and Say hi", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isCompleted: true))
    }
}
