//
//  MyToDoListApp.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 09/03/2026.
//

import SwiftUI

@main
struct MyToDoListApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = true //завжди буде висвічуватись темна тему прог.
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
