//
//  TaskRow.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 14/03/2026.
//

import SwiftUI

struct TaskRow: View {
    //MARK: - Propirties
    var model: TaskModel
    let action: () -> ()
    
    //MARK: - Body
    var body: some View {
        HStack{
            model.isCompleted ? Text(model.taskTitle).strikethrough().foregroundColor(Color.tdPrimary.opacity(0.5)) : Text(model.taskTitle)
            
            Spacer()
            
            Button {
                action()
            } label: {
                Image(systemName: model.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.tdAccent)
            }
            .buttonStyle(.borderless)
        } //hs
        .font(.headline)
        .padding()
        .background(model.isCompleted ? Color.tdPrimary.opacity(0.1) : Color.tdAccent.opacity(0.25))
        .cornerRadius(10)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .padding(.vertical, 6)
        
    }//body
}

#Preview {
    List{
        TaskRow(model: TaskModel(taskTitle: "Task 1", isCompleted: true)) {}
        TaskRow(model: TaskModel(taskTitle: "Task 2", isCompleted: false)) {}
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)
}
