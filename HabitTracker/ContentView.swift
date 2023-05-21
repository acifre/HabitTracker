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
        VStack {
            
            List {
                ForEach(activitiesModel.activities) { activity in
                    Text(activity.name)
                    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
