//
//  TaskListView.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 09/03/2026.
//

import SwiftUI

struct TaskListView: View {
    
    //MARK: - Propirties
    @EnvironmentObject var vm: ViewModel
    @State private var isEditViewPersented = false
    
    //MARK: - Body
    var body: some View {
        NavigationStack{
            ZStack{
                
                //MARK: - Background
                BackgroundView()
                VStack{
                    if vm.tasks.isEmpty {
                        NoTaskView() //Empty List
                    } else {
                        List{ //List of Tasks
                            ForEach(vm.tasks) { task in
                                TaskRow(model: task) {
                                    vm.isComplitedTask(task: task)
                                }
                                .onTapGesture {
                                    vm.selectedTask = task
                                    isEditViewPersented = true
                                }
                            }
                            .onDelete(perform: vm.deletedTask)
                            
                            //MARK: - Edit View
                            .sheet(isPresented: $isEditViewPersented, content: {
                                if let taskToEdit = vm.selectedTask {
                                    EditTaskView(task: taskToEdit)
                                }
                            })
                        }//list
                        .listStyle(.plain)
                        
                        //MARK: - Progress View
                        ProgressView("Completion Task", value: vm.competionRate)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(Color.tdPrimary)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal)   
                    }//else
                }//vs
            }//zs
            
            //MARK: - Navigation Bar
            .navigationTitle("My To Do List")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image.init(systemName: "plus")
                            .foregroundStyle(Color.tdPrimary)
                    }
                }
            }
        }//ns
    }//body
}

#Preview {
    TaskListView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
