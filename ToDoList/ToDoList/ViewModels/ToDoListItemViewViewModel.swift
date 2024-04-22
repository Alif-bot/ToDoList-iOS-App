//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// viewModel for single list item
class ToDoListItemViewViewModel: ObservableObject {
    init(){
    }
    
    func toggleIsDone(item: ToDoListItem){
        var itemCheck = item
        itemCheck.setDone(!item.isCompleted)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("ToDoList")
            .document(itemCheck.id)
            .setData(itemCheck.asDictionaery())
        
    }
}
