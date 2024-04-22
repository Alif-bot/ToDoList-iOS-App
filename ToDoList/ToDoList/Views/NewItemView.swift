//
//  NewItemView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:30))
                .bold()
                .padding(.top,60)
            
            Form{
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                Button(action: {
                    
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert.toggle()
                    }
                    
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                        Text("Save")
                            .foregroundColor(.white)
                    }
                })

            }
        
        }
        .alert(isPresented: $viewModel.showAlert ){
            Alert(title: Text("Error"),message: Text("Please fill in all fields and date must be today or newer"))}
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented:Binding(get: {
            return true},set: {
                _ in
            }))
    }
}
