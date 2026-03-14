//
//  AddTaskView.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 09/03/2026.
//

import SwiftUI

struct AddTaskView: View {
    
    //MARK: - Propirties
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - Body
    var body: some View {
        ZStack{
            
            //MARK: - Background
                BackgroundView()
            VStack{
                //MARK: - TextField
                CustomTextField(placeholder: "Enter New Your Task")
                
                //MARK: - Add Task Button
                CustomButton(titleButton: "Add Task") {
                    vm.AddTask(task: vm.newTask)
                }
                Spacer()
            } //vs
            .padding()
        } //zs
        .onAppear{
            vm.newTask = ""
        }
        .navigationTitle("Add New Task")
        .navigationBarTitleDisplayMode(.inline)
    } //body
}

#Preview {
    AddTaskView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
