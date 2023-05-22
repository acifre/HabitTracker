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
    @State private var activityCompletion = 0
    
    
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
                Stepper("Completed Times", value: $activityCompletion)
                Button {
                    activitiesModel.activities.append(Activity(name: activityName, completionAmount: activityCompletion))
                } label: {
                    Text("Save Activity")
                }

            }
            .padding()
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
