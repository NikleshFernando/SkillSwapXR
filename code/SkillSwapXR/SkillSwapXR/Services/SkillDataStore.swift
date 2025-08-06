//
//  SkillDataStore.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-26.
//

import Foundation

class SkillDataStore: ObservableObject {
    @Published var skills: [Skill] = []

    private let key = "storedSkills"

    init() {
        loadSkills()
    }

    func loadSkills() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Skill].self, from: data) {
            self.skills = decoded
        }
    }

    func saveSkills() {
        if let data = try? JSONEncoder().encode(skills) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func addSkill(_ skill: Skill) {
        skills.append(skill)
        saveSkills()
    }
}
