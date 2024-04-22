//
//  ContentViewViewModel.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//
import FirebaseAuth
import Foundation

class ContentViewViewModel: ObservableObject{
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
