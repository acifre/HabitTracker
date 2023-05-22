//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Anthony Cifre on 5/22/23.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var activitiesModel: ActivitiesViewModel
    
    @State private var activityName = ""
    @State private var activityDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Enter the name of the habit...", text: $activityName)

                }
                Section("Description") {
                    TextField("Enter habit description...", text: $activityDescription, axis: .vertical)
                }
                
                Button {
                    addNewHabit()
                    dismiss()
                    
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "plus")
                        Text("Create new habbit")
                        Spacer()
                    }
                    .font(.title3)

                }

            }
            .navigationTitle("Add New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addNewHabit() {
        activitiesModel.activities.append(Activity(name: activityName, description: activityDescription, completionAmount: 0))
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(activitiesModel: ActivitiesViewModel())
    }
}
