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
    @Published var newTask = ""
    @Published var selectedTask: TaskModel?
    @Published var tasks: [TaskModel] = [] {
        didSet{
            saveTask()
        }
    }
    
    let keyUD = "keyUD"
    
    ///Progress View Propetry
    var competionRate: Double {
        let totalTasks = tasks.count
        let completionTasks =  tasks.filter { $0.isCompleted }.count
        return totalTasks > 0 ? Double(completionTasks) / Double(totalTasks) : 0
    }
    
    //MARK: - Initializer
    init() {
        getTasks()
    }
    
    //MARK: - SaveTask
    func saveTask() {
        do {
            let encodeTask = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodeTask, forKey: keyUD)
        }catch {
            print("Error saving task: \(error)")
        }
    }
    
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: keyUD) else { return }
        do {
            let decodeTask = try JSONDecoder().decode([TaskModel].self, from: data)
            DispatchQueue.main.async {
                self.tasks = decodeTask
            }
        }catch {
            print("Error loading task: \(error)")
        }
    }
    
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
    
    //MARK: - UpdateTask
    func updateTask(id: UUID, taskTitle: String) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].taskTitle = taskTitle
        }
    }

}
