//
//  ProfileView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI

struct ProfileView: View {

@StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = viewModel.user {
                    
                    profile(user: user)
                    
                } else {
                    Text("Profile Loading . . .")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    } // end of body view
    
   @ViewBuilder
    func profile(user: User) -> some View {
        // person Image/System Image
        
        Image(systemName: "person.circle")
            .resizable()
            .foregroundColor(.blue)
            .frame(width:100,height: 100)
            .padding()
        
        
        // Person Name, Email, Member Since
        
        VStack(alignment: .leading) {
            
            HStack{
                Text("Name:")
                Text(user.name)
            }
            .padding()
            
            HStack{
                Text("Email:")
                Text(user.email)
            }
            .padding()
            
            HStack{
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        // Sign Out
        
        Button("Log Out"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        .bold()
    

        Spacer()
    }
    
} // end of profileView view

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
