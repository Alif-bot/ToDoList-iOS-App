//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isCompleted: Bool
    
    mutating func setDone(_ state: Bool){
        isCompleted = state
    }
    
}
