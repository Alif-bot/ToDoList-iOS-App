//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]?
                     = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
      

@main
struct ToDoListApp: App{
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
    
        
        WindowGroup {
            NavigationView{
                ContentView()
            }
        
        }
    }
}
