//
//  CustomTextField.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 14/03/2026.
//

import SwiftUI

struct CustomTextField: View {
    
    //MARK: - Propirties
    @EnvironmentObject var vm: ViewModel
    let placeholder: String
    
    //MARK: - Body
    var body: some View {
        TextField(placeholder, text: $vm.newTask)
            .font(.headline)
            .padding()
            .background(Color.toDoPrimary.opacity(0.15))
            .cornerRadius(15)
    }
}

#Preview {
    CustomTextField(placeholder: "Enter New Your Task")
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
