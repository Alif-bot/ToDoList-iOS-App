//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    
    func save(){
        guard canSave else {
            return
        }
        
        // Get current user id
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        
        // crate a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isCompleted: false)
        
        
        
        // Save to database
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("ToDoList")
            .document(newId)
            .setData(newItem.asDictionaery())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
