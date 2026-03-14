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
                    List{
                        ForEach(vm.tasks) { task in
                            TaskRow(model: task) {
                                vm.isComplitedTask(task: task)
                            }
                            .onTapGesture {
                                isEditViewPersented = true
                            }
                        }
                        .onDelete(perform: vm.deletedTask)
                        
                        //MARK: - Edit View
                        .sheet(isPresented: $isEditViewPersented, content: {
                            EditTaskView()
                        })
                        
                    }//list
                    .listStyle(.plain)
                }//vs
            }//zs
            
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
