//
//  User.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
