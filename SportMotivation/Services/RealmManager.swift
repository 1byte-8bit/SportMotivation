//
//  RealmManager.swift
//  FirstApp05.04
//
//  Created by Alexandr on 24.04.2022.
//

import UIKit
import RealmSwift


class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    // Open the local-only default realm
    let localRealm = try! Realm()
    
    func saveWorkoutModel(model: WorkoutModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteWorkoutModel(model: WorkoutModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
}
