//
//  CustomButton.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 14/03/2026.
//

import SwiftUI

struct CustomButton: View {
    //MARK: - Propirties
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) private var dismiss
    let titleButton: String
    let action: () -> ()
    
    //MARK: - Body
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Text(titleButton)
                .font(.headline)
                .padding()
                .foregroundColor(Color.tdBackgroundOne)
                .frame(maxWidth: .infinity)
                .background(Color.toDoAccent)
                .cornerRadius(15)
        }
    }
}

#Preview {
    CustomButton(titleButton: "Add Task") {} 
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
