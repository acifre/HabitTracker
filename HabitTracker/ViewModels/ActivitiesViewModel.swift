//
//  Activities.swift
//  HabitTracker
//
//  Created by Anthony Cifre on 5/21/23.
//

import Combine
import Foundation
import SwiftUI

class ActivitiesViewModel: NSObject, ObservableObject {
    @Published var activities = [Activity]()

}
