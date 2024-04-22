//
//  RegistrationView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewViewModel()
    
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.green)
                    .frame(width: UIScreen.main.bounds.width*3, height:390 )
                    .rotationEffect(Angle(degrees: -15))
                    .offset(y:-150)
                
                Text("Registration Form")
                    .font(.system(size: 40))
                    .bold()
                    .padding(.bottom,130)

            }
            Spacer()
            Form{
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                
                SecureField("Create password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                Button(action: {viewModel.register()}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.green)
                        
                        Text("Create account")
                            .foregroundColor(.black)
                    }
                })
                .padding()
            }
            .offset(y: -60)
                
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
