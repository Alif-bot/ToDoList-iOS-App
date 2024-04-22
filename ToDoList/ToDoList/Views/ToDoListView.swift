//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 3/4/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @FirestoreQuery var items: [ToDoListItem]
    @StateObject var viewModel : ToDoListViewViewModel
    
        
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/ToDoList")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(items: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                } // List end
                
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    viewModel.showingNewItemView.toggle()

                    
                }, label: {Image(systemName:"plus")})
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
                
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "VIpfVZIKU8h2FZ1Tz0RsmEMxRTE3")
    }
}
