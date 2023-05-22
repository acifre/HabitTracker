//
//  ContentView.swift
//  HabitTracker
//
//  Created by Anthony Cifre on 5/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habitsModel = HabitsViewModel()
    
    @State private var habitName = ""
    @State private var acitivityDescription = ""
    @State private var activityCompletion = 1
    
    @State private var showingAddView = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Group {
                    if habitsModel.habits.count >= 1 {
                        
                        List {
                            ForEach(habitsModel.habits) { activity in
                                NavigationLink {
                                    Text("Detail View")
                                } label: {
                                    Text(activity.name)
                                }
                                
                            }
                            .onDelete { index in
                                habitsModel.habits.remove(atOffsets: index)
                            }
                        }
                    } else {
                        VStack {
                            Text("Create new habit")
                                .font(.title3)
                                .foregroundColor(.primary)
                                .padding(.bottom, 2)
                            Text("Your current habits will come here, create one by tapping on the plus button above")
                                .multilineTextAlignment(.center)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 10)
                        }
                        .padding()
                    }

                }

            }
            .padding()
            .navigationTitle("HabitTracker")
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
                AddHabitView(activitiesModel: habitsModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
