//
//  HeaderView.swift
//  ToDoList
//
//  Created by Md Alif Hossain on 4/4/24.
//

import SwiftUI

struct HeaderView: View {

    
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius:0)
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: 15))
    
                    
                
                VStack{
                    
                Text("To Do List")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top,50)
                    
                    Image(systemName: "list.bullet.clipboard")
                        .resizable()
                        .frame(width: 50,height: 50)
                        .foregroundColor(.white)
                        

                }
                    
            } // End of ZStack
            
            .frame(width: UIScreen.main.bounds.width*2,height: 300)
            .offset(y:-100)
            Spacer()
        } // End of VStack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
