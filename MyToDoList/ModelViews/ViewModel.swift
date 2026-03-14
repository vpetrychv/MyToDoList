//
//  ViewModel.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 10/03/2026.
//

import Foundation
import Combine
import SwiftUI

class ViewModel: ObservableObject {
    
    //MARK: - Propirties
    @Published var tasks: [TaskModel] = []
    @Published var newTask = ""
    
    //MARK: - AddTask
    func AddTask(task: String) {
        let newTask = TaskModel(taskTitle: task)
        tasks.append(newTask)
    }
    
    //MARK: - isComplitedTask
    func isComplitedTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    //MARK: - DeletedTask
    func deletedTask(task: IndexSet) {
        tasks.remove(atOffsets: task)
    }

}
