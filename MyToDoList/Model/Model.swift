//
//  Model.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 09/03/2026.
//

import Foundation

struct TaskModel: Identifiable {
    let id = UUID()
    var taskTitle: String
    var isCompleted: Bool = false
}
