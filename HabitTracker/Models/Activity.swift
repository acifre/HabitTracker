//
//  Activity.swift
//  HabitTracker
//
//  Created by Anthony Cifre on 5/21/23.
//

import Foundation

struct Activity: Identifiable {
    var id = UUID()
    var name: String
    var completionAmount: Int
}
