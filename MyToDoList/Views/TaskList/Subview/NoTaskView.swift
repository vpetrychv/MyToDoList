//
//  NoTaskView.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 16/03/2026.
//

import SwiftUI

struct NoTaskView: View {
    
    //MARK: - Body
    var body: some View {
        VStack{
            Spacer()
            
            //MARK: - Text
            Text("THERE ARE NO TASKS\nWOULD YOU LIKE\nTO ADD?")
                .font(.title)
                .foregroundStyle(Color.tdPrimary)
                .opacity(0.5)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            //MARK: - Add View Button
            NavigationLink(destination: AddTaskView()) {
                ZStack{
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(Color.tdPrimary)
                        .opacity(0.5)
                    
                    Image.init(systemName: "plus")
                        .foregroundStyle(Color.tdBackgroundTwo)
                        .font(.title)
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    NoTaskView()
        .preferredColorScheme(.dark)
}
