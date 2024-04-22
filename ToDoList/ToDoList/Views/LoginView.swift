//
//  LoginView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginView = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                HeaderView() // header view showed here
                
                Form{
                    
                    if !loginView.errorMessage.isEmpty {
                        Text(loginView.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    
                    TextField("Enter your email", text: $loginView.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Enter your password",text: $loginView.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    Button(action: {loginView.login()}, label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            Text("Log In")
                                .bold()
                                .foregroundColor(.white)
                            
                        }
                        
                    })
                    .padding()
                }
                .offset(y: -60)
                
                // RegistrationView will come to play
                VStack{
                    Text("Don't have an account?")
                    NavigationLink("Create an account", destination: RegistrationView())
                }
                .padding(.bottom,20)
                
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
