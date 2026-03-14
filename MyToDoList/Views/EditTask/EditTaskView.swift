//
//  EditTaskView.swift
//  MyToDoList
//
//  Created by Vasyl Petrych on 14/03/2026.
//

import SwiftUI

struct EditTaskView: View {
    
    //MARK: - Propirties
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - Body
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                
                //Title
                Text("Edit Task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                    //Cancel Button
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                            .frame(width: 56)
                            .foregroundColor(Color.tdAccent)
                        }
                    }//overlay
                    .padding(.vertical)
            }//hs
            
            CustomTextField(placeholder: "Edit Your Task")
            CustomButton(titleButton: "Save") {
                //
            }
            Spacer()
        }//vs
        .padding()
        .background(BackgroundView())
    }//body
}//view

#Preview {
    EditTaskView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
