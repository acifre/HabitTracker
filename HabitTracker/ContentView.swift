//
//  ContentView.swift
//  HabitTracker
//
//  Created by Anthony Cifre on 5/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var activitiesModel = ActivitiesViewModel()
    
    @State private var activityName = ""
    @State private var acitivityDescription = ""
    @State private var activityCompletion = 1
    
    @State private var showingAddView = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(activitiesModel.activities) { activity in
                        NavigationLink {
                            Text("Detail View")
                        } label: {
                            Text(activity.name)
                        }
                        
                    }
                    .onDelete { index in
                        activitiesModel.activities.remove(atOffsets: index)
                    }
                }
                TextField("Activity Name", text: $activityName)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                Stepper("Completed Times", value: $activityCompletion)
                    .padding()
                Button {
                    activitiesModel.activities.append(Activity(name: activityName, description: acitivityDescription, completionAmount: activityCompletion))
                } label: {
                    Text("Save Activity")
                }

            }
            .padding()
            .toolbar {
                ToolbarItem {
                    HStack {
                        EditButton()
                        Button {
                            showingAddView = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding([.trailing,.top, .bottom])
                    }

                }
            }
            .sheet(isPresented: $showingAddView) {
                AddHabitView(activitiesModel: activitiesModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
