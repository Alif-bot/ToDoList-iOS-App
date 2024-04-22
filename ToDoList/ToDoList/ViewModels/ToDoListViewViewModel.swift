//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import Foundation
import FirebaseFirestore

// ViewModel for list of items view

class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("ToDoList")
            .document(id)
            .delete()
        
    }
}

