//
//  ContentView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        VStack{
            
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
                // signed in
                
                accountView
                
            } else{
                 LoginView()
            }        }
    }
    
    @ViewBuilder
    var accountView: some View{
        
        TabView{
            ToDoListView(userId:viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            //Spacer()
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
