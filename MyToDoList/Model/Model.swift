//
//  Model.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 09/03/2026.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    var taskTitle: String
    var isCompleted: Bool = false
}
