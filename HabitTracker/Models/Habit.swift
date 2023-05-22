//
//  Activity.swift
//  HabitTracker
//
//  Created by Anthony Cifre on 5/21/23.
//

import Foundation

struct Habit: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var completionAmount: Int
}
