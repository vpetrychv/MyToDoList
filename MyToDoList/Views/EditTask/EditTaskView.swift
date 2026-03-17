//
//  EditTaskView.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 14/03/2026.
//

import SwiftUI

struct EditTaskView: View {
    
    //MARK: - Propirties
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) private var dismiss
    var task: TaskModel
    
    //MARK: - Body
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                
                //Title
                Text("Edit Task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                    //Cancel Button
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                            .frame(width: 56)
                            .foregroundColor(Color.tdAccent)
                        }
                    }//overlay
                    .padding(.vertical)
            }//hs
            
            //Save
            CustomTextField(placeholder: "Edit Your Task")
            CustomButton(titleButton: "Save") {
                vm.updateTask(id: task.id, taskTitle: vm.newTask)
            }
            Spacer()
        }//vs
        .padding()
        .background(BackgroundView())
        .onAppear{
            vm.newTask = task.taskTitle
        }
    }//body
}//view

#Preview {
    EditTaskView(task: TaskModel(taskTitle: "Task 1"))
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
